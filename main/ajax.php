<?php
include('bd.php');

$sql = mysqli_query($link, "SELECT * FROM info");
$sql2 = mysqli_query($link, "SELECT * FROM sales");
while ($array = mysqli_fetch_assoc($sql))
    $info[$array['id']] = $array;
$result[1] = $info;
$i = 0;
switch ($_POST['type'])
{
    case 1:
        foreach ($result[1] as $item){
            $result[2][$i] = $item['now'];
            $i++;
        }
        break;
    case 2:
        foreach ($result[1] as $item){
            $result[2][$i] = $item['yesterday'];
            $i++;
        }
        break;
    case 3:
        foreach ($result[1] as $item) {
            $result[2][$i] = $item['thisWeek'];
            $i++;
        }
        break;
}
header('Content-Type: application/json');
echo json_encode($result, JSON_UNESCAPED_UNICODE);