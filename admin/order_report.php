<?php
require('top.inc.php');

// Assuming you have a database connection set up in top.inc.php or in another included file.
// If not, you will need to establish a database connection here.

?>
<div class="content pb-0">
    <div class="orders">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <form action="Order_table.php" method="post">
                            <h4 class="box-title">Order Report By Customer</h4>
                    </div>
                    <div class="card-body--">
                        <div class="table-stats order-table ov-h">
                            <select class="form-control" name="cus_id" required>
                                <?php
                                // Corrected: Perform the query using a database connection.
                                $query = "SELECT * FROM users";
                                $result = mysqli_query($con, $query); // Assuming $conn is your database connection variable.
                                if ($result) {
                                    while ($data = mysqli_fetch_assoc($result)) {
                                        // Make sure you're using the correct column name, e.g., 'id' for the user's ID.
                                        echo "<option value='".htmlspecialchars($data['id'])."'>".htmlspecialchars($data['name'])."</option>";
                                    }
                                } else {
                                    echo "<option value=''>No users found</option>";
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <input type="submit" class="form-control" value="Submit" />

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
require('footer.inc.php');
?>
