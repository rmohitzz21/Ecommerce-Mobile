<?php
session_start();
$con = mysqli_connect("localhost", "root", "", "imobile");
define('SERVER_PATH', $_SERVER['DOCUMENT_ROOT'] . '/ecomm2');
define('SITE_PATH', 'http://localhost/ecomm2/');

define('PRODUCT_IMAGE_SERVER_PATH', SERVER_PATH . '/media/product/');

define('PRODUCT_IMAGE_SITE_PATH', SITE_PATH . '/media/product/');

define('BANNER_SERVER_PATH', SERVER_PATH . '/media/banner/');

define('BANNER_SITE_PATH', SITE_PATH . '/media/banner/');

define('PRODUCT_MULTIPLE_IMAGE_SERVER_PATH', SERVER_PATH . '/media/product_images/');
define('PRODUCT_MULTIPLE_IMAGE_SITE_PATH', SITE_PATH . '/media/product_images/');
?>
