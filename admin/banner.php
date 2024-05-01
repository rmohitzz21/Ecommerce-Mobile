<?php
require('top.inc.php');



// Check if 'type' is set in the GET request and is not empty
if (isset($_GET['type']) && $_GET['type'] != '') {
    // Sanitize and store the 'type' parameter from the GET request
    $type = get_safe_value($con, $_GET['type']);

    // Check if the type is 'status' to handle status change operations
    if ($type == 'status') {
        // Sanitize and store the 'operation' parameter (expected to be 'active' or some other value)
        $operation = get_safe_value($con, $_GET['operation']);
        // Sanitize and store the 'id' parameter indicating the ID of the banner to be updated
        $id = get_safe_value($con, $_GET['id']);

        // Determine the status value based on the operation requested
        if ($operation == 'active') {
            $status = '1'; // Set status to '1' for active
        } else {
            $status = '0'; // Otherwise, set status to '0' for inactive
        }

        // Prepare the SQL query to update the banner's status
        $update_status_sql = "update banner set status='$status' where id='$id'";
        // Execute the query to update the banner status in the database
        mysqli_query($con, $update_status_sql);
    }

    // Check if the type is 'delete' to handle delete operations
    if ($type == 'delete') {
        // Sanitize and store the 'id' parameter indicating the ID of the banner to be deleted
        $id = get_safe_value($con, $_GET['id']);
        // Prepare the SQL query to delete the banner from the database
        $delete_sql = "delete from banner where id='$id'";
        // Execute the query to delete the banner from the database
        mysqli_query($con, $delete_sql);
    }
}

/**
 * Assumes the existence of a function `get_safe_value()` not shown here,
 * which is likely responsible for sanitizing input values to prevent SQL injection or other security issues.
 */


$sql = "select * from banner order by id desc";
$res = mysqli_query($con, $sql);
?>
<div class="content pb-0">
    <div class="orders">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="box-title">Banner </h4>
                        <h4 class="box-link"><a href="manage_banner.php">Add banner</a> </h4>
                    </div>
                    <div class="card-body--">
                        <div class="table-stats order-table ov-h">
                            <table class="table ">
                                <thead>
                                    <tr>
                                        <th class="serial">#</th>
                                        <th>Heading1</th>
                                        <th>Heading2</th>
                                        <th>Btn Text</th>
                                        <th>Btn Link</th>
                                        <th>Image</th>
                                        <th>Order No</th>

                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    while ($row = mysqli_fetch_assoc($res)) { ?>
                                        <tr>
                                            <td class="serial"><?php echo $i ?></td>
                                            <td><?php echo $row['heading1'] ?></td>
                                            <td><?php echo $row['heading2'] ?></td>
                                            <td><?php echo $row['btn_txt'] ?></td>
                                            <td><?php echo $row['btn_link'] ?></td>
                                            
                                            <td>
                                                <?php
                                                echo "<a target='_blank' href='" . BANNER_SITE_PATH . $row['image'] . "'><img width='150px' src='" . BANNER_SITE_PATH . $row['image'] . "' /></a>";
                                                ?>
                                            </td>
                                            <td><?php echo $row['order_no'] ?></td>

                                            <td>
                                                <?php
                                                if ($row['status'] == 1) {
                                                    echo "<span class='badge badge-complete'><a href='?type=status&operation=deactive&id=" . $row['id'] . "'>Active</a></span>&nbsp;";
                                                } else {
                                                    echo "<span class='badge badge-pending'><a href='?type=status&operation=active&id=" . $row['id'] . "'>Deactive</a></span>&nbsp;";
                                                }
                                                echo "<span class='badge badge-edit'><a href='manage_banner.php?id=" . $row['id'] . "'>Edit</a></span>&nbsp;";

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