<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>23-24 월별 기온 및 강수량</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>23-24 월별 기온 및 강수량</h1>

    <div class="chart-container">
        <canvas id="temperatureChart" width="100%" height="40px"></canvas>
    </div>
    <div class="chart-container">
        <canvas id="rainfallChart" width="100%" height="40px"></canvas>
    </div>

    <div class="table-container">
        <table id="weatherTable">
            <thead>
                <tr>
                    <th>구분</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            var temperatureChart;
            var rainfallChart;

            function loadWeatherData() {
                $.ajax({
                    url: 'http://127.0.0.1:5000/weatherTempRain',
                    type: 'GET',
                    success: function(response) {
                        var weather_conditions = response.weather_conditions;
                        var avg = response.avg;
                        var max_temp = response.max_temp;
                        var min_temp = response.min_temp;
                        var rain = response.rain;

                        var ctx = document.getElementById('temperatureChart').getContext('2d');

                        temperatureChart = new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: weather_conditions,
                                datasets: [
                                    {
                                        label: '평균기온(℃)',
                                        data: avg,
                                        borderColor: 'rgba(255, 99, 132, 1)',
                                        fill: false
                                    },
                                    {
                                        label: '최고기온 평균(℃)',
                                        data: max_temp,
                                        borderColor: 'rgba(255, 159, 64, 1)',
                                        fill: false
                                    },
                                    {
                                        label: '최저기온 평균(℃)',
                                        data: min_temp,
                                        borderColor: 'rgba(75, 192, 192, 1)',
                                        fill: false
                                    }
                                ]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });

                        var ctxrain = document.getElementById('rainfallChart').getContext('2d');

                        rainfallChart = new Chart(ctxrain, {
                            type: 'bar',
                            data: {
                                labels: weather_conditions,
                                datasets: [
                                    {
                                        label: '강수량(mm)',
                                        data: rain,
                                        backgroundColor: 'rgba(153, 102, 255, 0.2)',
                                        borderColor: 'rgba(153, 102, 255, 1)',
                                        borderWidth: 1
                                    }
                                ]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });

                      
                        var tableColumns = response.table_columns;
                        var tableData = response.table_data;

                        // 표 헤더
                        var tableHeader = '<tr>';
                        for (var i = 0; i < tableColumns.length; i++) {
                            tableHeader += '<th>' + tableColumns[i] + '</th>';
                        }
                        tableHeader += '</tr>';
                        $('#weatherTable thead').html(tableHeader);

                        // 표 본문
                        var tableBody = '';
                        for (var i = 0; i < tableData.length; i++) {
                            tableBody += '<tr>';
                            for (var j = 0; j < tableData[i].length; j++) {
                                tableBody += '<td>' + tableData[i][j] + '</td>';
                            }
                            tableBody += '</tr>';
                        }
                        $('#weatherTable tbody').html(tableBody);
                    },
                    error: function(error) {
                        console.log('Error:', error);
                    }
                });
            }

            // 첫화면 데이터
            loadWeatherData();
        });
    </script>
</body>
</html>
