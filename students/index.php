
<?php

include './data/StudentService.php';
include './data/StudentSerializer.php';

$student_id = htmlspecialchars($_GET["id"]);

$student = new StudentService();
$studentAndFormat = $student->getStudentDetails($student_id);

$studentData = $studentAndFormat['student'];
$format = $studentAndFormat['format'];

$serializer = new StudentSerializer();
$response = $format === 'JSON' ? $serializer->toJson($studentData) : $serializer->toXml($studentData);

header('Content-Type: application/json');
echo $response;
