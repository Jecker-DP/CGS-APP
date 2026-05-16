<?php
$servername = "localhost";   // usually localhost
$username = "root";          // default XAMPP username
$password = "";              // default XAMPP password is empty
$dbname = "cgs_android"; // change to your actual database

// Define variables for compatibility with PDO usage in users/ files
$server = $servername;
$dbase = $dbname;

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
