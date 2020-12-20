<?php

class Student {

    public $id;

    public $name;

    public $grades;

    public $average;

    public $passed;

    public function __construct($id, $name, $grades, $average, $passed)
    {
        $this->id      = $id;
        $this->name    = $name;
        $this->grades  = $grades;
        $this->average = $average;
        $this->passed  = $passed;
    }
}

?>