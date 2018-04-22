<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sitefinderRooms";
// Create connection
$conn = mysqli_connect($servername, $username, $password);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";

mysqli_select_db($conn,"sitefinderRooms");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Search results</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
	<?php

									// This function will run within each post array including multi-dimensional arrays 
function ExtendedAddslash(&$params)
{ 
        foreach ($params as &$var) {
            // check if $var is an array. If yes, it will start another ExtendedAddslash() function to loop to each key inside.
            is_array($var) ? ExtendedAddslash($var) : $var=addslashes($var);
            unset($var);
        }
} 

// Initialize ExtendedAddslash() function for every $_POST variable
ExtendedAddslash($_POST);      

$newrname = empty($_POST['newrname']) ? '' : $_POST['newrname'];
$newrname = str_replace(' ', '', $newrname);

$newrfaculty = empty($_POST['newrfaculty']) ? '' : $_POST['newrfaculty'];
$newrfaculty = str_replace(' ', '', $newrfaculty);

$newrcampus = empty($_POST['newrcampus']) ? '' : $_POST['newrcampus'];
$newrcampus = str_replace(' ', '', $newrcampus);

$newrlat = empty($_POST['newrlat']) ? '' : $_POST['newrlat'];
$newrlat = str_replace(' ', '', $newrlat);

$newrlong = empty($_POST['newrlong']) ? '' : $_POST['newrlong'];
$newrlong = str_replace(' ', '', $newrlong);

$newrtype = empty($_POST['newrtype']) ? '' : $_POST['newrtype'];
$newrtype = str_replace(' ', '', $newrtype);

$newrseats = empty($_POST['newrseats']) ? '' : $_POST['newrseats'];
$newrseats = str_replace(' ', '', $newrseats);

$newrproj = empty($_POST['newrproj']) ? '' : $_POST['newrproj'];
$newrproj = str_replace(' ', '', $newrproj);

$newrbuildingname = empty($_POST['newrbuildingname']) ? '' : $_POST['newrbuildingname'];
$newrbuildingname = str_replace(' ', '', $newrbuildingname);

$newrbuildingcampus = empty($_POST['newrbuildingcampus']) ? '' : $_POST['newrbuildingcampus'];
$newrbuildingcampus = str_replace(' ', '', $newrbuildingcampus);


// search submission ID




    $sql = "INSERT INTO newroomrequest (newrname, newrfaculty, newrcampus, newrlat, newrlong, newrtype, newrseats, newrproj, newrbuildingname, newrbuildingcampus) 
                               VALUES ('$newrname', '$newrfaculty', '$newrcampus', 
                                                 '$newrlat', '$newrlong', '$newrtype', '$newrseats','$newrproj','$newrbuildingname', '$newrbuildingcampus') ";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();

?>