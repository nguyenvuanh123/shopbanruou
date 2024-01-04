<!DOCTYPE html>
<html lang="en">
<head>
	<?php $this->load->view('site/head',$this->data); ?>
</head>
<body>
<?php
if(isset($_GET['msg']) && $_GET['msg'] == 1) {
    echo '<script>alert("Thêm vào giỏ hàng thành công!");</script>';
}
if(isset($_GET['msg']) && $_GET['msg'] == 2) {
    echo '<script>alert("Đăng nhập thành công!");</script>';
}
if(isset($_GET['msg']) && $_GET['msg'] == 3) {
    echo '<script>alert("Đặt hàng thành công!");</script>';
	echo '<script>window.location.href = "'.base_url('cart').'";</script>';
}
if(isset($_GET['msg']) && $_GET['msg'] == 4) {
    echo '<script>alert("Bạn chỉ được mua hàng khi có tài khoản trên 18 tuổi!");</script>';
	echo '<script>window.location.href = "'.base_url('dang-ky').'";</script>';
}
?>

	<div class="container">
		<?php $this->load->view('site/header',$this->data); ?>
		<?php $this->load->view('site/slider',$this->data); ?>
		<?php $this->load->view($temp,$this->data); ?>
		<?php $this->load->view('site/footer',$this->data); ?>
	</div>
    <script src="<?php echo public_url('site/'); ?>bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
