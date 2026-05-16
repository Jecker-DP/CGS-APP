<?php
header("Content-Type: application/json");

// Database connection
$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "cgs_android";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Connection failed"]);
    exit;
}

// Collect POST values
$student_number = $conn->real_escape_string($_POST['student_number']);
$first_name     = $conn->real_escape_string($_POST['first_name']);
$last_name      = $conn->real_escape_string($_POST['last_name']);
$email          = $conn->real_escape_string($_POST['email']);
$password       = $_POST['password']; // plain text from user

// Hash the password
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// Check if student already exists (student_number or email)
$check = $conn->query("SELECT id FROM students WHERE student_number='$student_number' OR email='$email'");
if ($check->num_rows > 0) {
    echo json_encode(["status" => "exists", "message" => "Student already registered"]);
    exit;
}

// Insert student into database
$sql = "INSERT INTO students (student_number, first_name, last_name, email, password)
        VALUES ('$student_number', '$first_name', '$last_name', '$email', '$hashedPassword')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(["status" => "success", "message" => "Registration successful"]);
} else {
    echo json_encode(["status" => "error", "message" => "Error: " . $conn->error]);
}

$conn->close();
?>
