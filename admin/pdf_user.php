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
                                    <th class="product-thumbnail"> Email</th>
                                    <th class="product-name">Added On</th>
                                    <th class="product-price">Mobile</th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                // $uid = $_SESSION['USER_ID'];
                                $res = mysqli_query($con, "SELECT * FROM users ORDER BY added_on DESC");
                                // $total_price = 0;
                                while ($row = mysqli_fetch_assoc($res)) {
                                    // $total_price = $total_price + ($row['qty'] * $row['price']);
                                ?>
                                    <tr>
                                        <td class="product-name"><?php echo $row['name'] ?></td>
                                        <td class="product-name"><?php echo $row['email'] ?></td>
                                        <td class="product-name"><?php echo $row['added_on'] ?></td>
                                        <td class="product-name"><?php echo $row['mobile'] ?></td>


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
                                background-color:aqua;
                                /* Add more styling as needed */
                            }
                        </style>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div><?php
        require('footer.inc.php');
        ?>