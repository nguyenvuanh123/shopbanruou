<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 clearpaddingr">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
		<ol class="breadcrumb">
		  <li><a href="<?php echo base_url(); ?>#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
		  <li class="active">Lịch sử đặt hàng</li>
		</ol>
		<div class="col-md-12 clearpadding">
		<div class="panel panel-info">
		  <div class="panel-heading">
		    <h3 class="panel-title">Danh sách đặt hàng của <?php echo $user->name; ?></h3>
		  </div>
		  <div class="panel-body">
		  	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
			  <table class="table table-hover">
						<thead>
							<tr class="info">										
								<th class="text-center">STT</th>
								<th>Ngày đặt hàng</th>
								<th>Sản phẩm</th>
								<th>Tổng tiền</th>
								<th>Trạng thái</th>		
							</tr>
						</thead>
						<?php

							$connect = mysqli_connect ('localhost', 'root', '', 'shopdienthoai') or die ('Không thể kết nối tới database');
							mysqli_set_charset($connect, 'UTF8');
							$id = $user->id;
							$sql = "
									SELECT * 
									FROM transaction
									WHERE user_id = '".$id."'
								";
							$query = mysqli_query($connect, $sql);
							
							?>
						<tbody>

							<?php 
								$stt = 0;
								while ($rows = mysqli_fetch_array($query, MYSQLI_ASSOC)) {
								$stt = $stt + 1;
								?>
								<tr>
									<td><strong><?php echo $stt; ?></strong></td>
									<td><strong><?php echo mdate("%d/%m/%Y",$rows['created']); ?></strong></td>
									<td>
										<?php
										$tranid = $rows['id'];
										$sqlo = "
										SELECT a.*, b.name, b.image_link
										FROM `order` as a, product as b
										WHERE transaction_id = '".$tranid."' 
										AND a.product_id = b.id
										";
										$queryo = mysqli_query($connect, $sqlo);
										while ($rowo = mysqli_fetch_array($queryo, MYSQLI_ASSOC)) {
										?>
										<div style="height : 65px">
										<img src="<?php echo base_url(); ?>upload/product/<?php echo $rowo['image_link']; ?>" alt="" style="width: 50px;height : 55px;float:left;margin-right: 10px;">
										<strong><?php echo $rowo['name']; ?></strong>,<strong> SL : </strong><?php echo $rowo['qty']; ?>,<strong> Giá : </strong><?php echo number_format($rowo['amount']); ?>VNĐ
										</div>
										<?php } ?>

									</td>
									<td><strong><?php echo number_format($rows['amount']); ?></strong> VNĐ</td>
									<td>
										<?php switch ($rows['status']) {
											case '0':
												echo "<p style='color:red'>Đang chờ </p>";
												break;
											case '1':
												echo "<p style='color:green'>Đã xác nhận</p>";
												break;
											default:
												echo 'Đang chờ';
												break;
										} ?>
									</td>
				                </tr>
							<?php } ?>

			    		</tbody>

					</table>
		  		</div>	
		  	</div>
		  </div>
		</div>
		
	</div>
</div>
