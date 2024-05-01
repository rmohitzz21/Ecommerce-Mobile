<?php
require('connection.inc.php');
require('functions.inc.php');

echo '<b>Transaction In Process, Please do not reload</b>';

prx($_POST);
// Collect POST data
$payment_mode = $_POST['mode'];
$pay_id = $_POST['mihpayid'];
$status = $_POST["status"];
$firstname = $_POST["firstname"];
$amount = $_POST["amount"];
$txnid = $_POST["txnid"];
$posted_hash = $_POST["hash"];
$key = $_POST["key"];
$productinfo = $_POST["productinfo"];
$email = $_POST["email"];

// Constants
$MERCHANT_KEY = "gtKFFx";
$SALT = "4R38IvwiV57FwVpsgOvTXBdLE4tHUXFW";

// Assuming udf1 to udf5 are empty as they're not included in your script
$udf1 = $udf2 = $udf3 = $udf4 = $udf5 = '';

// Create hash string according to the correct formula
$hashString = "$MERCHANT_KEY|$txnid|$amount|$productinfo|$firstname|$email|$udf1|$udf2|$udf3|$udf4|$udf5||||||$SALT";
$sentHashString = strtolower(hash('sha512', $hashString));

// Check hash
if ($sentHashString != $posted_hash) {
    // Hash mismatch, redirect to failure
?>
    <script>
        window.location.href = 'payment_fail.php';
    </script>
<?php
} else {
    // Hash matches, update the order and redirect to thank you page
    mysqli_query($con, "UPDATE `order` SET payment_status='$status', mihpayid='$pay_id' WHERE txnid='$txnid'");
?>
    <script>
        window.location.href = 'thank_you.php';
    </script>
<?php
}
?>