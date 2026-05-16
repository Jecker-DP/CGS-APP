<?php
header('Content-Type: application/json');

$conn = new mysqli("localhost", "root", "", "cgsapp");

if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "DB connection failed"]);
    exit();
}

$student_number = $_POST['student_number'] ?? '';
$bio = $_POST['bio'] ?? '';
$contact_no = $_POST['contact_no'] ?? '';

$profile_pic_filename = null;

// 🔹 Handle profile picture upload (if sent)
if (isset($_FILES['profile_pic']) && $_FILES['profile_pic']['error'] === UPLOAD_ERR_OK) {
    $uploadDir = "uploads/";
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $fileTmpPath = $_FILES['profile_pic']['tmp_name'];
    $fileName = basename($_FILES['profile_pic']['name']);
    $fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

    // Unique filename (avoid overwrite)
    $newFileName = uniqid("profile_", true) . "." . $fileExt;
    $destPath = $uploadDir . $newFileName;

    if (move_uploaded_file($fileTmpPath, $destPath)) {
        $profile_pic_filename = $newFileName;
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed"]);
        exit();
    }
}

// 🔹 Update query
if ($profile_pic_filename) {
    $sql = "UPDATE students 
            SET bio = ?, contact_no = ?, profile_pic = ? 
            WHERE student_number = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $bio, $contact_no, $profile_pic_filename, $student_number);
} else {
    $sql = "UPDATE students 
            SET bio = ?, contact_no = ? 
            WHERE student_number = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $bio, $contact_no, $student_number);
}

if ($stmt->execute()) {
    echo json_encode([
        "status" => "success",
        "message" => "Profile updated",
        "profile_pic" => $profile_pic_filename 
            ? "http://192.168.1.2/CGSAPP/uploads/" . $profile_pic_filename 
            : null
    ]);
} else {
    echo json_encode(["status" => "error", "message" => "Update failed"]);
}
?>
