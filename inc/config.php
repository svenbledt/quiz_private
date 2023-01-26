<?php 
// set the default timezone to use. Available since PHP 5.1
date_default_timezone_set('Europe/Berlin');

if (isset($_SESSION['LOGGEDIN'])) {
    $logged_in = true;
} else {
    $logged_in = false;
}


