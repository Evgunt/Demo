<?php ;
include  ('main/requests.php');
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,400;1,200;1,400&display=swap" rel="stylesheet">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="js/jquery-3.7.0.min.js"></script>
    <script src="js/main.js"></script>
    <title>Demo</title>
</head>
<body>
    <main>
        <div class="table">
            <div class="tr tr-first">
                <div>Показатель</div>
                <div class="div--blue" data-click="1">Текущий день</div>
                <div data-click="2">Вчера</div>
                <div data-click="3">Этот день недели</div>
            </div>
            <figure class="highcharts-figure">
                <div id="diagram"></div>
            </figure>
            <?php

            foreach ($result[1] as $item) {
                $yesterday = '';
                $yes_class = '';
                $yes_span_class = '';
                $thisWeek = '';
                $week_class = '';
                $week_span_class = '';
                foreach($result[2] as $sales) {
                    if($sales['parent'] == $item['id'])
                    {
                        if($sales['position'] == 2)
                        {
                            if($sales['sign']) {
                                $yes_class = 'div--green';
                                $yesterday = '+'.$sales['value'].'%';
                                $yes_span_class = 'span--green';
                            }
                            else{
                                $yes_class = 'div--red';
                                $yesterday = '-'.$sales['value'].'%';
                                $yes_span_class = 'span--red';
                            }
                        }
                        else{
                            if($sales['sign']) {
                                $week_class = 'div--green';
                                $thisWeek = '+'.$sales['value'].'%';
                                $week_span_class = 'span--green';
                            }
                            else{
                                $week_class = 'div--red';
                                $thisWeek = '-'.$sales['value'].'%';
                                $week_span_class = 'span--red';
                            }
                        }

                    }
                }
                echo '<div class="tr">
                        <div>'.$item['name'].'</div>
                        <div class="div--blue" data-name="1">'.number_format($item['now'], 0,',', ' ').'</div>
                        <div class="'.$yes_class.'" data-name="2">'.number_format($item['yesterday'],0,',', ' ').'
                            <span class="'.$yes_span_class.'">'.$yesterday.'</span>
                        </div>
                        <div class="'.$week_class.'" data-name="3">'.number_format($item['thisWeek'], 0, ',', ' ').'
                            <span class="'.$week_span_class.'">'.$thisWeek.'</span>
                        </div>
                    </div>';
            }
            ?>
        </div>
    </main>
</body>
</html>