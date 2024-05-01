<?php
require('top.inc.php');
$size = '';
$msg = '';
$order_by = '';
if (isset($_GET['id']) && $_GET['id'] != '') {
	$id = get_safe_value($con, $_GET['id']);
	$res = mysqli_query($con, "select * from  `size_master` where id='$id'");
	$check = mysqli_num_rows($res);
	if ($check > 0) {
		$row = mysqli_fetch_assoc($res);
		$size = $row['size'];
		$order_by = $row['order_by'];
	} else {
		header('location: size.php');
		die();
	}
}

if (isset($_POST['submit'])) {
	$size = get_safe_value($con, $_POST['size']);
	$order_by = get_safe_value($con, $_POST['order_by']);
	$res = mysqli_query($con, "select * from  `size_master` where  size='$size'");
	$check = mysqli_num_rows($res);
	if ($check > 0) {
		if (isset($_GET['id']) && $_GET['id'] != '') {
			$getData = mysqli_fetch_assoc($res);
			if ($id == $getData['id']) {
			} else {
				$msg = "Memory  already exist";
			}
		} else {
			$msg = " Memory already exist";
		}
	}

	if ($msg == '') {
		if (isset($_GET['id']) && $_GET['id'] != '') {
			mysqli_query($con, "UPDATE `size_master` set  size='$size',order_by='$order_by' where id='$id'");
		} else {
			mysqli_query($con, "INSERT INTO  `size_master`(size,status,order_by) values('$size','1','$order_by')");
		}
		header('location:size.php');
		die();
	}
}
?>
<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header"><strong> size master</strong><small> Form</small></div>
					<form method="post">
						<div class="card-body card-block">
							<div class="form-group">
								<label for="size" class="form-control-label"> Memory : </label>
								<input type="text" name="size" placeholder="Enter Size name" class="form-control" required value="<?php echo $size ?>">
							</div>
							<div class="form-group">
								<label for="order_by" class="form-control-label"> order By : </label>
								<input type="text" name="order_by" placeholder="Enter Order By" class="form-control" required value="<?php echo $order_by ?>">
							</div>
							<button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block">
								<span id="payment-button-amount">Submit</span>
							</button>
							<div class="field_error"><?php echo $msg ?></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<?php
require('footer.inc.php');
?>