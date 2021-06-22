<?php
    if (empty($_POST['rating']) || empty($_POST['courseId'])) {
        return false;
    }
 
        $rating = $_POST['rating'];
        $courseId = $_POST['courseId'];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "kursas";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
        }

        $sql = "UPDATE kursai SET kursai.Reitingas =".$rating." WHERE kursai.Kurso_id =".$courseId."";

        if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully";
        } else {
        echo "Error updating record: " . $conn->error;
        }

        $conn->close();