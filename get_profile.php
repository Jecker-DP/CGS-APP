<?php
header('Content-Type: application/json');
$conn = new mysqli("localhost", "root", "", "cgsapp");

$student_number = $_GET['student_number'] ?? '';

$sql = "SELECT name, email, bio, contact_no, profile_pic FROM students WHERE student_number = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $student_number);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    echo json_encode([
        "name" => $row['name'],
        "email" => $row['email'],
        "bio" => $row['bio'],
        "contact_no" => $row['contact_no'],
        // return full URL of profile pic
        "profile_pic" => !empty($row['profile_pic']) 
            ? "http://192.168.1.2/CGSAPP/uploads/" . $row['profile_pic'] 
            : ""
    ]);
} else {
    echo json_encode(["error" => "No record found"]);
}
?>
