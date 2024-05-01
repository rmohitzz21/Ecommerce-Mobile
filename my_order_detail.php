<?php
require('top.php');
if (!isset($_SESSION['USER_LOGIN'])) {
?>
    <script>
        window.location.href = 'index.php';
    </script>
<?php
}
$order_id = get_safe_value($con, $_GET['id']);
?>
<div class="ht__bradcaump__area" style="background: rgba(233, 236, 239, 1)  no-repeat scroll center center / cover ;">
    <div class="ht__bradcaump__wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="bradcaump__inner">
                        <nav class="bradcaump-inner">
                            <a class="breadcrumb-item" href="index.html">Home</a>
                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                            <span class="breadcrumb-item active">Thank You</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Bradcaump area -->
<!-- cart-main-area start -->
<h1>Order Invoice</h1><br>
<h3>Thank you for your purchase! Below you will find the details of your order.</h3>

<div class="wishlist-area ptb--100 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="wishlist-content">
                    <form action="#">
                        <div class="wishlist-table table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">Product Name</th>
                                        <th class="product-thumbnail">Product Image</th>
                                        <th class="product-name">Qty</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-price">Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $uid = $_SESSION['USER_ID'];
                                    $res = mysqli_query($con, "select distinct(order_detail.id) ,order_detail.*,product.name,product.image from order_detail,product ,`order` where order_detail.order_id='$order_id' and `order`.user_id='$uid' and order_detail.product_id=product.id");
                                    $total_price = 0;
                                    while ($row = mysqli_fetch_assoc($res)) {
                                        $total_price = $total_price + ($row['qty'] * $row['price']);
                                    ?>
                                        <tr>
                                            <td class="product-name"><?php echo $row['name'] ?></td>
                                            <td class="product-name"> <img src="<?php echo PRODUCT_IMAGE_SITE_PATH . $row['image'] ?>"></td>
                                            <td class="product-name"><?php echo $row['qty'] ?></td>
                                            <td class="product-name">₹<?php echo $row['price'] ?></td>
                                            <td class="product-name">₹<?php echo $row['qty'] * $row['price'] ?></td>

                                        </tr>
                                    <?php } ?>
                                    <tr>
                                        <td colspan="3"></td>
                                        <td class="product-name">Total Price</td>
                                        <td class="product-name"><?php echo $total_price ?></td>

                                    </tr>
                                </tbody>

                            </table>
                            <style>
                                body {
                                    font-family: Arial, sans-serif;
                                    line-height: 1.6;
                                }

                                table {
                                    width: 100%;
                                    border-collapse: collapse;
                                }

                                th,
                                td {
                                    text-align: left;
                                    padding: 10px;
                                    border: 1px solid #ddd;
                                }

                                th {
                                    background-color: #f2f2f2;
                                }

                                tr:hover {
                                    background-color: #f5f5f5;
                                }

                                img {
                                    width: 80px;
                                    height: auto;
                                }

                                .total-price {
                                    font-weight: bold;
                                }
                            </style>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<?php require('footer.php') ?>