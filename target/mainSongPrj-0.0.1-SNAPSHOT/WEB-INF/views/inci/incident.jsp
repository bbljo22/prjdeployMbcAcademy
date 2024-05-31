<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>교통사고 현황</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>교통사고 현황</h1>

    <div class="button-container">
        <button type="button" class="big-button" data-year="2018년">2018년</button>
        <button type="button" class="big-button" data-year="2019년">2019년</button>
        <button type="button" class="big-button" data-year="2020년">2020년</button>
        <button type="button" class="big-button" data-year="2021년">2021년</button>
        <button type="button" class="big-button" data-year="2022년">2022년</button>
    </div>

    <div class="chart-container">
        <canvas id="incidentChart" width="100%" height="40px"></canvas>
    </div>

    <div class="table-container">
        <table id="incidentTable">
            <thead>
                <tr>
                    <th>구분</th>
                    <th>사망사고발생건수</th>
                    <th>중상사고발생건수</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            var incidentChart;

            function loadIncidentData(year) {
                console.log("연도:", year);
                $.ajax({
                    url: 'http://127.0.0.1:5000/incident',
                    type: 'GET',
                    success: function(response) {
                        
                        var data = response.data[year];
                        var labels = data.chart_labels;
                        var chartDataLeft = data.chart_data_left;
                        var chartDataRight = data.chart_data_right;

                        // 차트
                        var ctx = document.getElementById('incidentChart').getContext('2d');
                        if (incidentChart) {
                            incidentChart.destroy();
                        } // 이거 없으면 연도 정보 변경 안됨 // 있는 차트 초기화하는 코드
                        incidentChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: labels,
                                datasets: [
                                    {
                                        label: '사망사고발생건수',
                                        data: chartDataLeft,
                                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                        borderColor: 'rgba(255, 99, 132, 1)',
                                        borderWidth: 1
                                    },
                                    {
                                        label: '중상사고발생건수',
                                        data: chartDataRight,
                                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                        borderColor: 'rgba(54, 162, 235, 1)',
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

                        // 테이블 데이터 설정
                        var tableBody = '';
                        for (var i = 0; i < labels.length; i++) {
                            tableBody += '<tr>';
                            tableBody += '<td>' + labels[i] + '</td>';
                            tableBody += '<td>' + chartDataLeft[i] + '</td>';
                            tableBody += '<td>' + chartDataRight[i] + '</td>';
                            tableBody += '</tr>';
                        }
                        $('#incidentTable tbody').html(tableBody);
                    },
                    error: function(error) {
                        console.log('Error:', error);
                    }
                });
            }

            // 버튼 클릭 시 데이터 로드
            $('.big-button').click(function() {
                var year = $(this).data('year');
                console.log("Button clicked for year:", year); // 클릭 확인
                loadIncidentData(year);
            });

            // 초기 로드 시 기본 연도 데이터 로드
            loadIncidentData('2018년');
        });
    </script>
</body>
</html>
