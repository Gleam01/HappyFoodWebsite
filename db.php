<?php
require_once("connect_db.php");
$query = file_get_contents("hfdbtest.sql");

$stmt = $database->prepare($query);

if ($stmt->execute())
     echo "Success";
else 
     echo "Fail";