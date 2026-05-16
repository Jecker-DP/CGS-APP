<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cgs_android";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

$date = $_GET['date'] ?? '';

if (empty($date)) {
    echo json_encode(["error" => "Date parameter is required"]);
    exit;
}

// Define all possible time slots
$all_times = ["9:00 AM", "10:00 AM", "11:00 AM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM"];

// Query booked times for the date
$sql = "SELECT schedule_time FROM appointments WHERE schedule_day = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $date);
$stmt->execute();
$result = $stmt->get_result();

$booked_times = [];
while ($row = $result->fetch_assoc()) {
    $booked_times[] = $row['schedule_time'];
}

$stmt->close();
$conn->close();

// Filter available times
$available_times = array_diff($all_times, $booked_times);

echo json_encode(array_values($available_times));
?>
