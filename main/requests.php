<?php
include('bd.php');

$sql = mysqli_query($link, "SELECT * FROM info");
$sql2 = mysqli_query($link, "SELECT * FROM sales");
while ($array = mysqli_fetch_assoc($sql))
    $info[$array['id']] = $array;
while ($array = mysqli_fetch_assoc($sql2))
    $sales[$array['id']] = $array;

$result[1] = $info;
$result[2] = $sales;
