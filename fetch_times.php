<?php
header('Content-Type: application/json');
include 'db_connect.php';

$date = $_GET['date'] ?? '';

if (empty($date)) {
    echo json_encode([]);
    exit;
}

$stmt = $conn->prepare("SELECT time_slot FROM schedule_slots WHERE schedule_date = ? AND is_booked = 0");
$stmt->bind_param("s", $date);
$stmt->execute();
$result = $stmt->get_result();

$times = [];
while ($row = $result->fetch_assoc()) {
    $times[] = $row['time_slot'];
}

echo json_encode($times);
?>
