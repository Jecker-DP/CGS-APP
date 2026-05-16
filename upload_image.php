<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

require_once 'config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed']);
    exit;
}

$student_id = isset($_POST['student_id']) ? (int)$_POST['student_id'] : 0;

if ($student_id <= 0) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Invalid student ID']);
    exit;
}

// Check if file was uploaded
if (!isset($_FILES['profile_image']) || $_FILES['profile_image']['error'] !== UPLOAD_ERR_OK) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'No image file uploaded or upload error']);
    exit;
}

$file = $_FILES['profile_image'];

// Validate file type
$allowed_types = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'];
if (!in_array($file['type'], $allowed_types)) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Invalid file type. Only JPG, PNG, and GIF are allowed']);
    exit;
}

// Validate file size (max 5MB)
$max_size = 5 * 1024 * 1024; // 5MB
if ($file['size'] > $max_size) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'File too large. Maximum size is 5MB']);
    exit;
}

// Create uploads directory if it doesn't exist
$upload_dir = 'uploads/profile_images/';
if (!file_exists($upload_dir)) {
    mkdir($upload_dir, 0755, true);
}

// Generate unique filename
$file_extension = pathinfo($file['name'], PATHINFO_EXTENSION);
$filename = 'profile_' . $student_id . '_' . time() . '.' . $file_extension;
$filepath = $upload_dir . $filename;

try {
    // Move uploaded file to destination
    if (move_uploaded_file($file['tmp_name'], $filepath)) {
        // Update database with new image path
        $stmt = $conn->prepare("UPDATE students SET profile_image_path = ? WHERE student_id = ?");
        $stmt->bind_param("si", $filename, $student_id);

        if ($stmt->execute()) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Profile image uploaded successfully',
                'image_path' => $filename
            ]);
        } else {
            // Delete uploaded file if database update fails
            unlink($filepath);
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Failed to update database']);
        }

        $stmt->close();
    } else {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Failed to save uploaded file']);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => 'Upload error: ' . $e->getMessage()]);
}

$conn->close();
?>
