<?php
include("top.inc.php");
$cus_id = $_POST['cus_id'];



?>

<div class="content pb-0">
    <div class="orders">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="box-title">Products </h4>
                        <h4 class="box-link"><a href="manage_product.php">Add Product</a> </h4>
                    </div>
                    <div class="card-body--">
                        <div class="table-stats order-table ov-h">
                            <table class="table ">
                                <thead>
                                    <tr>
                                        <th class="serial">#</th>
                                        <th>ID</th>
                                        <th>Categories</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>MRP</th>
                                        <th>Price</th>
                                        <th>Qty</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    while ($row = mysqli_fetch_assoc($res)) { ?>
                                        <tr>
                                            <td class="serial"><?php echo $i ?></td>
                                            <td><?php echo $row['id'] ?></td>
                                            <td><?php echo $row['categories'] ?></td>
                                            <td><?php echo $row['name'] ?></td>
                                            <td><img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $row['image'] ?>" /></td>
                                            <td><?php echo $row['mrp'] ?></td>
                                            <td><?php echo $row['price'] ?></td>
                                            <td><?php echo $row['qty'] ?></td>
                                            <td>
                                                <?php
                                                if ($row['status'] == 1) {
                                                    echo "<span class='badge badge-complete'><a href='?type=status&operation=deactive&id=" . $row['id'] . "'>Active</a></span>&nbsp;";
                                                } else {
                                                    echo "<span class='badge badge-pending'><a href='?type=status&operation=active&id=" . $row['id'] . "'>Deactive</a></span>&nbsp;";
                                                }
                                                echo "<span class='badge badge-edit'><a href='manage_product.php?id=" . $row['id'] . "'>Edit</a></span>&nbsp;";

                                                echo "<span class='badge badge-delete'><a href='?type=delete&id=" . $row['id'] . "'>Delete</a></span>";

                                                ?>
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
</div>
<?php
require('footer.inc.php');
?>