<?php
require('top.inc.php');


?>


<link rel="stylesheet" href="custom.css">
<!-- ----------- -->
<div class="title__line--6">
    <h3 style='margin-bottom: 10px ; margin-top: 105px' ;> Order Report </h3>
</div>
<div class="wishlist-area ptb--100 bg__white">
    <!-- <div class="container"> -->
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="wishlist-content">
                <form action="#">
                    <div class="wishlist-table table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">User Name</th>
                                    <th class="product-thumbnail">Product Name</th>
                                    <th class="product-name">Qty</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-price">Order Status</th>
                                    <th class="product-price">Payment Status</th>
                                    <th class="product-price">Order Placed </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                // $uid = $_SESSION['ADMIN_ID'];
                                $res = mysqli_query($con, "SELECT 
                                    u.name AS UserName,
                                    p.name AS ProductName,
                                    od.qty AS Quantity,
                                    od.price AS Price,
                                    os.name AS OrderStatus,
                                    o.payment_status AS PaymentStatus,
                                    o.added_on AS date
                                FROM
                                    `order` o
                                    INNER JOIN `users` u ON o.user_id = u.id
                                    INNER JOIN `order_detail` od ON o.id = od.order_id
                                    INNER JOIN `product` p ON od.product_id = p.id
                                    INNER JOIN `order_status` os ON o.order_status = os.id
                                ORDER BY
                                    o.added_on DESC;");
                                // $total_price = 0;
                                while ($row = mysqli_fetch_assoc($res)) {
                                    // $total_price = $total_price + ($row['qty'] * $row['price']);
                                ?>
                                    <tr>
                                        <td class="product-name"><?php echo $row['UserName'] ?></td>
                                        <td class="product-name"><?php echo $row['ProductName'] ?></td>
                                        <td class="product-name"><?php echo $row['Quantity'] ?></td>
                                        <td class="product-name">₹<?php echo $row['Price'] ?></td>
                                        <td class="product-name"><?php echo $row['OrderStatus'] ?></td>
                                        <td class="product-name"><?php echo $row['PaymentStatus'] ?></td>
                                        <td class="product-name"><?php echo $row['date'] ?></td>

                                    </tr>
                                <?php } ?>
                                <tr>


                                </tr>
                            </tbody>

                        </table>

                    </div>
                    <div class="print">
                        <button onclick="window.print()">print</button>

                        <style>
                            .print {
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                height: 100vh;
                                /* This makes the div take the full height of the viewport */
                                margin: 0;
                            }

                            button {
                                padding: 10px 20px;
                                font-size: 16px;
                                cursor: pointer;
                                background-color: aqua;
                                /* Add more styling as needed */
                            }
                        </style>
                </form>
            </div>
        </div>
    </div>
</div>
</div>


<?php
require('footer.inc.php');
?>