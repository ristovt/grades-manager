<?php

include "StudentDataLoader.php";
include "Student.php";

class StudentService {

    public function getStudentDetails(int $id)
    {
        $studentDataLoader = new StudentDataLoader();

        $studentData = $studentDataLoader->getStudentDetails($id);

        $schoolBoardId = $studentData[0][2];
        $schoolBoard = $studentDataLoader->getSchoolBoard($schoolBoardId);

        $grades = array_map(function($data) {
            return $data[4];
        }, $studentData);

        $studentAverage = $this->calculateAverage($grades);

        $sbName = $schoolBoard[1];
        $passed = false;

        if ($sbName === "CSM") {
            $passed = $studentAverage >= 7;
        } else if ($sbName === "CSMB") {
            if (count($grades) > 2) {
                $lowest = min($grades);
                $grades = array_filter($grades, function($item) use($lowest) {
                    return $item !== $lowest;
                });
            }
            $studentAverage = $this->calculateAverage($grades);
            $highestGrade = max($grades);
            $passed = $highestGrade > 8;
        }

        $student = new Student($studentData[0][0], $studentData[0][1], $grades, $studentAverage, $passed);

        return [
            'student' => $student,
            'format' => $schoolBoard[2]
        ];
    }

    public function calculateAverage(array $grades)
    {
        $gradesCount = count($grades);
        $sum = 0;

        foreach($grades as $grade) {
            $sum += intval($grade);
        }

        return $sum / $gradesCount;
    }
}

?>