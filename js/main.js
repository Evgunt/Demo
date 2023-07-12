$(document).ready(function () {
    var rezults = [];
    function getData(type)
    {
        $.ajax({
            url: '/main/ajax.php',
            type: 'POST',
            data: 'type='+type,
            dataType: 'json',
            cache: false,
            success: function(jsondata){
                let i = 0;
                $.each(jsondata[2],function(indx, element) {
                    rezults[i] = parseInt(element);
                    i++;
                });
                Highcharts.chart('diagram', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: '',
                        align: 'left'
                    },
                    plotOptions: {
                        series: {
                            label: {
                                connectorAllowed: false
                            },
                        }
                    },
                    series: [{
                        name: '',
                        data: rezults
                    }],
                    responsive: {
                        rules: [{
                            condition: {
                                maxWidth: 500
                            },
                            chartOptions: {
                                legend: {
                                    layout: 'horizontal',
                                    align: 'center',
                                    verticalAlign: 'bottom'
                                }
                            }
                        }]
                    }

                });

            }});
    }
    getData(1);
    $('.tr-first div').click(function(){
        let num = $(this).attr('data-click');
        if(num) {
            getData(num);
            $('.tr-first div').removeClass('div--blue');
            $('.tr div').each(function () {
                $(this).removeClass('div--blue');
            });
            $('.tr div[data-name="' + num + '"]').each(function () {
                $(this).addClass('div--blue');
            });
            $(this).addClass('div--blue');
        }
    });
});