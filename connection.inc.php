<?php
// Start a new session or resume the current session
session_start();

// Connect to the MySQL database using the mysqli extension
$con = mysqli_connect("localhost","root","","imobile");

// Define a constant for the server path to the root of the e-commerce project
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/ecomm2');

// Define a constant for the site URL path to the root of the e-commerce project
define('SITE_PATH','http://localhost/ecomm2/');

// Define a constant for the server path to the directory where product images are stored
define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'/media/product/');

// Define a constant for the URL path to the directory where product images are accessible
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'/media/product/');

// Define a constant for the server path to the directory where banner images are stored
define('BANNER_SERVER_PATH',SERVER_PATH.'/media/banner/');

// Define a constant for the URL path to the directory where banner images are accessible
define('BANNER_SITE_PATH',SITE_PATH.'/media/banner/');

// Define a constant for the server path to the directory where multiple images for a single product are stored
define('PRODUCT_MULTIPLE_IMAGE_SERVER_PATH',SERVER_PATH.'/media/product_images/');

// Define a constant for the URL path to the directory where multiple images for a single product are accessible
define('PRODUCT_MULTIPLE_IMAGE_SITE_PATH',SITE_PATH.'/media/product_images/');

?>
