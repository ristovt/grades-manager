<?php

class StudentSerializer {

    public function toJson($student)
    {
        return json_encode($student);
    }

    public function toXml($student)
    {
        $grades = array_map(function($item) { return "<grade>" . $item . "</grade>"; }, $student->grades);

        return $res = "<student>
            <id>" . $student->id . "</id>
            <name>" . $student->name . "</name>
            <grades>". implode("\n", $grades) . "</grades>
            <average>" . $student->average . "</average>
            <passed>" . $student->passed . "</passed>
        </student>";
    }

}