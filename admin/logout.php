<?php

// Start or resume the current session to access session variables
session_start();

// unset() destroys the specified variable(s)
// Here, it's used to clear the session variable that indicates the admin is logged in
unset($_SESSION['ADMIN_LOGIN']);

// Clears the session variable holding the admin's username
unset($_SESSION['ADMIN_USERNAME']);

// Redirects the user to the login page using the HTTP Location header
header('location:login.php');

// Terminates the execution of the script. 
// This is important to ensure that no further code is executed once the redirection is initiated.
die();
