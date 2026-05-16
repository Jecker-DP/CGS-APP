<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Add error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 0); // Don't display errors to users
ini_set('log_errors', 1);

include 'db_connect.php';

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents('php://input');
    $data = json_decode($input, true);
    
    // If JSON input is not available, use POST data
    if ($data === null) {
        $data = $_POST;
    }
    
    $student_number = $data['student_number'] ?? '';
    
    if (empty($student_number)) {
        echo json_encode(['error' => 'Student number is required']);
        exit;
    }

    try {
        // Get student data
        $stmt_student = $conn->prepare("SELECT id, first_name, last_name FROM students WHERE student_number = ? LIMIT 1");
        $stmt_student->bind_param("s", $student_number);
        $stmt_student->execute();
        $result_student = $stmt_student->get_result();
        
        if ($result_student->num_rows === 0) {
            echo json_encode(['error' => 'Student not found']);
            exit;
        }
        
        $student_data = $result_student->fetch_assoc();
        $student_id = $student_data['id'];
        $stmt_student->close();

        // Collect form data with proper null checks
        $first_name = $data['first_name'] ?? '';
        $last_name = $data['last_name'] ?? '';
        $consent_agreement = $data['consent_agreement'] ?? '0';
        $nickname = $data['nickname'] ?? '';
        $program_yr_sec = $data['program_yr_sec'] ?? '';
        $contact_no = $data['contact_no'] ?? '';
        $age = $data['age'] ?? '';
        $gender = $data['gender'] ?? '';
        $date_of_birth = $data['date_of_birth'] ?? '';
        $religion = $data['religion'] ?? '';
        $civil_status = $data['civil_status'] ?? '';
        $current_address = $data['current_address'] ?? '';
        $staying_at = $data['staying_at'] ?? '';
        $staying_with = $data['staying_with'] ?? '';
        $parent_guardian_name = $data['parent_guardian_name'] ?? '';
        $parent_guardian_contact = $data['parent_guardian_contact'] ?? '';
        $referred_by = $data['referred_by'] ?? '';
        $taking_med = $data['taking_med'] ?? '';
        $med_specify = $data['med_specify'] ?? '';
        $experienced_counseling = $data['experienced_counseling'] ?? '';
        $counseling_places = $data['counseling_places'] ?? '';
        $type_of_concern = $data['type_of_concern'] ?? '';
        $reasons = $data['reasons'] ?? '';
        $goals = $data['goals'] ?? '';
        $schedule_day = $data['schedule_day'] ?? '';
        $schedule_time = $data['schedule_time'] ?? '';
        $confirmation = $data['confirmation'] ?? '0';
        $privacy_consent = $data['privacy_consent'] ?? '0';

        // Validate required fields
        if (empty($schedule_day) || empty($schedule_time)) {
            echo json_encode(['error' => 'Schedule date and time are required']);
            exit;
        }

        // Insert appointment
        $sql = "INSERT INTO appointments 
            (student_id, first_name, last_name, nickname, consent_agreement, program_yr_sec, contact_no, age, gender, date_of_birth, religion, civil_status, current_address, staying_at, staying_with, parent_guardian_name, parent_guardian_contact, referred_by, taking_med, med_specify, experienced_counseling, counseling_places, type_of_concern, reasons, goals, schedule_day, schedule_time, confirmation, privacy_consent, created_at)
            VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())";

        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            throw new Exception('Database prepare error: ' . $conn->error);
        }

        $bind_result = $stmt->bind_param(
            "issssssssssssssssssssssssssss",
            $student_id, $first_name, $last_name, $nickname, $consent_agreement,
            $program_yr_sec, $contact_no, $age, $gender, $date_of_birth, $religion, $civil_status,
            $current_address, $staying_at, $staying_with,
            $parent_guardian_name, $parent_guardian_contact, $referred_by,
            $taking_med, $med_specify, $experienced_counseling, $counseling_places,
            $type_of_concern, $reasons, $goals, $schedule_day, $schedule_time,
            $confirmation, $privacy_consent
        );

        if (!$bind_result) {
            throw new Exception('Parameter binding error: ' . $stmt->error);
        }

        if ($stmt->execute()) {
            $appointment_id = $conn->insert_id;

            // Update schedule slot
            $stmt_slot = $conn->prepare("UPDATE schedule_slots SET is_booked = 1 WHERE schedule_date = ? AND time_slot = ? LIMIT 1");
            $stmt_slot->bind_param("ss", $schedule_day, $schedule_time);
            $stmt_slot->execute();
            $stmt_slot->close();
            
            echo json_encode([
                'success' => 'Appointment saved successfully',
                'appointment_id' => $appointment_id,
                'student_id' => $student_id,
                'student_number' => $student_number
            ]);
        } else {
            throw new Exception('Failed to save appointment: ' . $stmt->error);
        }

        $stmt->close();
        
    } catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
    
    $conn->close();
    
} else {
    echo json_encode(['error' => 'Invalid request method. Use POST.']);
}
?>