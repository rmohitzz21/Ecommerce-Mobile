<?php
session_start();
require_once 'connection.inc.php'; // Ensure you have this file for database connection

if (isset($_POST['delete_order'])) {
    $order_id = $_POST['order_id'];
    $uid = $_SESSION['USER_ID'];

    // Validate ownership and existence of the order
    $query = "SELECT * FROM `order` WHERE id = '$order_id' AND user_id = '$uid'";
    $result = mysqli_query($con, $query);

    if (mysqli_num_rows($result) > 0) {
        // Perform delete operation
        $deleteQuery = "DELETE FROM `order` WHERE id = '$order_id'";
        if (mysqli_query($con, $deleteQuery)) {
            // Successfully deleted
            header('Location: my_order.php?status=success'); // Redirect to orders page or where appropriate
        } else {
            // Error handling
            header('Location: my_order.php?status=error');
        }
    } else {
        // Order doesn't exist or user doesn't have permission
        header('Location: my_order.php?status=forbidden');
    }
}
