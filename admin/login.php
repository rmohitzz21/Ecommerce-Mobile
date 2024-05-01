<?php
// session_start(); // Start the session

require('connection.inc.php');
require('functions.inc.php');
$msg = '';
if (isset($_POST['submit'])) {
   $username = get_safe_value($con, $_POST['username']);
   $password = get_safe_value($con, $_POST['password']);
   $sql = "SELECT * FROM admin_user WHERE username='$username' and password = '$password'";
   $result = mysqli_query($con, $sql);
   $count = mysqli_num_rows($result);
   if ($count > 0) {
      $row = mysqli_fetch_assoc($result);
      if ($row['status'] == '0') {
         $msg = "Account deactivated";
      } else {
         $_SESSION['ADMIN_LOGIN'] = 'yes';
         $_SESSION['ADMIN_ID'] = $row['id']; // Remove single quotes around $username
         $_SESSION['ADMIN_USERNAME'] = $username;
         $_SESSION['ADMIN_ROLE'] = $row['role'];
         header('location:categories.php'); // Remove space after 'location'
         die();
      }
   } else {
      $msg = "Please enter correct login details";
   }
}
if (!empty($msg)) {
   echo $msg; // Display message if login fails
}

?>

<!doctype html>
<html class="no-js" lang="">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Login Page</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="assets/css/normalize.css">
   <link rel="stylesheet" href="assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="assets/css/font-awesome.min.css">
   <link rel="stylesheet" href="assets/css/themify-icons.css">
   <link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
   <link rel="stylesheet" href="assets/css/flag-icon.min.css">
   <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
   <link rel="stylesheet" href="assets/css/style.css">
   <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
   <style>
      body.bg-dark {
            /* Set the background image */
            background-image: url('images/login.jpg');
            /* Make it cover the entire page */
            background-size: cover;
            /* Set the background to no-repeat */
            background-repeat: no-repeat;
            /* Center the background image */
            background-position: center;
            /* Fixed background (does not scroll with the page) */
            background-attachment: fixed;
        }
      
   </style>
</head>

<body class="bg-dark">
   <div class="sufee-login d-flex align-content-center flex-wrap">
      <div class="container">
         <div class="login-content">
            <div class="login-form mt-150">
               <form method="POST">
                  <div class="form-group">
                     <label>username</label>
                     <input type="text" name='username' class="form-control" placeholder="Username" required>
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="password" class="form-control" placeholder="Password" required>
                  </div>
                  <button type="submit" name="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
               </form>
               <div class="field_error"> <?php echo $msg  ?></div>
            </div>
         </div>
      </div>
   </div>
   <script src="assets/js/vendor/jquery-2.1.4.min.js" type="text/javascript"></script>
   <script src="assets/js/popper.min.js" type="text/javascript"></script>
   <script src="assets/js/plugins.js" type="text/javascript"></script>
   <script src="assets/js/main.js" type="text/javascript"></script>
</body>

</html>