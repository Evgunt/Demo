<?php
$link = mysqli_connect("localhost", "root", "", "demo");
if ($link === false) {
    die("Ошибка: " . mysqli_connect_error());
}


