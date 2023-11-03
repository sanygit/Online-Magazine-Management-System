<style>
    .img-avatar{
        width:45px;
        height:45px;
        object-fit:cover;
        object-position:center center;
        border-radius:100%;
    }
</style>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Comments</h3>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-hover table-striped">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="20%">
					<col width="30%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>#</th>
						<th>Date Created</th>
						<th>From</th>
						<th>Comment</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$mwhere = "";
						if($_settings->userdata('type') != 1){
							$mwhere = " where magazine_id in (SELECT id FROM magazine_list where user_id = '{$_settings->userdata('id')}') and status = 1";
						}
						$i = 1;
						$qry = $conn->query("SELECT * from `comment_list` {$mwhere} order by `status` asc,unix_timestamp(date_created) desc ");
						while($row = $qry->fetch_assoc()):
						
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td class=""><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
							<td><?php echo ucwords($row['name']) ?></td>
							<td class="truncate-1"><?php echo $row['comment'] ?></td>
							<td class="text-center">
                                <?php
                                    switch($row['status']){
                                        case '1':
                                            echo "<span class='badge badge-success bg-primary badge-pill'>Verified</span>";
                                            break;
                                        case '0':
                                            echo "<span class='badge badge-secondary badge-pill'>Not Verified</span>";
                                            break;
                                    }
                                ?>
                            </td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item view_data" href="javascript:void(0)" data-id ="<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
				                    <div class="dropdown-divider"></div>
									<?php if($row['status'] != 1): ?>
				                    <a class="dropdown-item verify_comment" href="javascript:void(0)" data-id="<?= $row['id'] ?>"  data-name="<?= $row['name'] ?>"><span class="fa fa-check text-primary"></span> Verify</a>
				                    <div class="dropdown-divider"></div>
									<?php endif; ?>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
				                  </div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.verify_comment').click(function(){
			_conf("Are you sure to verify comment?","verify_comment",[$(this).attr('data-id')])
		})
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this Comment permanently?","delete_comment",[$(this).attr('data-id')])
		})
		$('.view_data').click(function(){
			uni_modal("Comment Details","comments/view_comment.php?id="+$(this).attr('data-id'))
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable({
            columnDefs: [
                { orderable: false, targets: 5 }
            ],
        });
	})
	function delete_comment($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_comment",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
	function verify_comment($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=verify_comment",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>