<?php

include ("DbConnection.php");

class StudentDataLoader {

    public function getStudentDetails(int $id)
    {

        $sql = "SELECT s.id, concat(s.first_name, ' ', s.last_name) as name, s.school_board_id, sub.name, ssg.grade FROM `student` as s
        INNER JOIN student_subject_grade as ssg ON (s.id = ssg.student_id)
        INNER JOIN subject as sub ON (sub.id = ssg.subject_id)
        WHERE s.id=".$id;

        $conn = DbConnection::connectToDb();

        $result = $conn->query($sql);
        $data = $result->fetch_all();

        $result->close();

        $conn->close();

        return $data;
    }

    public function getSchoolBoard(int $id)
    {

        $sql = "SELECT * FROM school_board WHERE id=".$id;

        $conn = DbConnection::connectToDb();

        $result = $conn->query($sql);
        $data = $result->fetch_row();

        $result->close();

        $conn->close();

        return $data;
    }

}

?>