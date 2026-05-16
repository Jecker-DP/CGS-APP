<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

require_once 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
    exit;
}

$student_id = isset($_POST['student_id']) ? (int)$_POST['student_id'] : 0;
$first_name = isset($_POST['first_name']) ? trim($_POST['first_name']) : '';
$last_name = isset($_POST['last_name']) ? trim($_POST['last_name']) : '';
$email = isset($_POST['email']) ? trim($_POST['email']) : '';

if ($student_id <= 0) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Invalid student ID']);
    exit;
}

if (empty($first_name) || empty($last_name) || empty($email)) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'All fields are required']);
    exit;
}

// Validate email format
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Invalid email format']);
    exit;
}

try {
    $stmt = $conn->prepare("UPDATE students SET first_name = ?, last_name = ?, email = ? WHERE id = ?");
    $stmt->bind_param("sssi", $first_name, $last_name, $email, $student_id);

    if ($stmt->execute()) {
        if ($stmt->affected_rows > 0) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Profile updated successfully'
            ]);
        } else {
            http_response_code(404);
            echo json_encode(['status' => 'error', 'message' => 'Student not found']);
        }
    } else {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Failed to update profile']);
    }

    $stmt->close();
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()]);
}

$conn->close();
?>
