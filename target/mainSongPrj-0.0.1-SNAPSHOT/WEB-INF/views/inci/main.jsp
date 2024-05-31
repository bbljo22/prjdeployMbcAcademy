<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<h1>18-23년 서울 사고 발생 건수</h1>

<div class="chart-container" >
    <canvas id="myChart"  width="400" height="400"></canvas>
</div>


<script>
	$(document).ready(function() {
	    $.ajax({
	        url: 'http://127.0.0.1:5000/main',
	        type: 'GET',
	        success: function(response) {
	        	var years = response.years
	        	var deaths = response.deaths_data
	        	var injuries = response.injuries_data
	        	
                var ctx = document.getElementById('myChart').getContext('2d');
                myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: years,
                        datasets: [
                            {
                                label: '중상사고',
                                data: injuries,
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            },
                            {
                                label: '사망사고',
                                type: 'line',
                                data: deaths,
                                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                borderColor: 'rgba(255, 99, 132, 1)',
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
            },
            error: function(error) {
                console.log('에러 :', error);
            }
        });
    });

    
    </script>

    </body>
    </html>

