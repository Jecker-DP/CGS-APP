<?php
header('Content-Type: application/json');
include 'db_connect.php'; // your DB connection

// Get POST data
$studentNumberOrEmail = isset($_POST['email_or_student_number']) ? trim($_POST['email_or_student_number']) : '';
$password = isset($_POST['password']) ? trim($_POST['password']) : '';

if (empty($studentNumberOrEmail) || empty($password)) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Student number/email and password are required.'
    ]);
    exit;
}

// Prepare and execute query
$sql = "SELECT id, student_number, first_name, last_name, password 
        FROM students
        WHERE student_number=? OR email=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $studentNumberOrEmail, $studentNumberOrEmail);
$stmt->execute();
$result = $stmt->get_result();

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();

    if (password_verify($password, $row['password'])) {
        echo json_encode([
            "status" => "success",
            "message" => "Login successful",
            "student_id" => (int)$row['id'],                  // cast to int for consistency
            "student_number" => (string)$row['student_number'], // cast to string (safe for numbers or alphanumerics)
            "first_name" => $row['first_name'],
            "last_name" => $row['last_name']
        ]);
    } else {
        echo json_encode(["status" => "error", "message" => "Wrong password"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "User not found"]);
}

$stmt->close();
$conn->close();
?>
