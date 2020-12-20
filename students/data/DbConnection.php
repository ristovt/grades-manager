<?php

class DbConnection {

    public static function connectToDb()
    {
        $host     = "localhost";
        $user     = "root";
        $password = "";
        $db       = "grades-manager";

        $connection = new mysqli($host, $user, $password, $db);
        
        if ($connection->connect_error) {
            die("ERROR: Unable to connect: " . $connection->connect_error);
        } 

        return $connection;
    }

}

?>