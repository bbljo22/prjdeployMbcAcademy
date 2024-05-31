<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>교통사고 현황</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .big-button {
            padding: 10px 20px;
            font-size: 18px;
            margin: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>교통사고 현황</h1>

    <div class="button-container">
        <button class="big-button" id="timeIncidentBtn">시간대별 교통사고 현황</button>
        <button class="big-button" id="weekIncidentBtn">요일별 교통사고 현황</button>
        <button class="big-button" id="weatherIncidentBtn">날씨별 교통사고 현황</button>
    </div>

    <div class="form-container">
        <label for="region">자치구 선택:</label>
        <select name="region" id="region">
        </select>
        <button type="button" id="fetchData">조회</button>
    </div>

    <div class="chart-container">
        <canvas id="myChart" width="100%" height="40px"></canvas>
    </div>

    <div class="table-container">
        <table id="incidentTable">
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
            var myChart;
            var regions = ["종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구",
            	"성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", 
            	"강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"];
            var selectedRegion = regions[0]; // 기본 지역
            var currentEndpoint = 'timeincident'; // 기본 flask 주소 설정

            // 자치구 드롭다운
            var regionSelect = $('#region');
            regions.forEach(function(region) {
                var option = $('<option></option>').attr('value', region).text(region);
                regionSelect.append(option);
            });

            // 기본 선택 지역
            regionSelect.val(selectedRegion);

            function getData(endpoint, region) {
                console.log('flask 주소:', endpoint, ', 자치구:', region);
                $.ajax({
                    url: 'http://127.0.0.1:5000/' + endpoint,
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ data: [region] }),
                    success: function(response) {
                        console.log('Response:', response);

                        // 차트 데이터
                        var labels, dataset1, dataset2, dataset3, label1, label2, label3;
                        if (endpoint === 'timeincident') {
                            labels = response.times;
                            dataset1 = response.accidents;
                            dataset2 = response.deaths;
                            dataset3 = response.injuries;
                            label1 = '발생건수';
                            label2 = '사망자수';
                            label3 = '부상자수';
                        } else if (endpoint === 'weekincident') {
                            labels = response.days_of_week;
                            dataset1 = response.accidents;
                            dataset2 = response.deaths;
                            dataset3 = response.injuries;
                            label1 = '발생건수';
                            label2 = '사망자수';
                            label3 = '부상자수';
                        } else if (endpoint === 'weatherincident') {
                            labels = response.weather_conditions;
                            dataset1 = response.accidents;
                            dataset2 = response.deaths;
                            dataset3 = response.injuries;
                            label1 = '발생건수';
                            label2 = '사망자수';
                            label3 = '부상자수';
                        }

                        // 차트
                        var ctx = document.getElementById('myChart').getContext('2d');
                        if (myChart) {
                            myChart.destroy();
                        }
                        myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: labels,
                                datasets: [
                                    {
                                        label: label1,
                                        data: dataset1,
                                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                        borderColor: 'rgba(54, 162, 235, 1)',
                                        borderWidth: 1
                                    },
                                    {
                                        label: label2,
                                        data: dataset2,
                                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                        borderColor: 'rgba(255, 99, 132, 1)',
                                        borderWidth: 1,
                                        type: 'line',
                                        fill: false
                                    },
                                    {
                                        label: label3,
                                        data: dataset3,
                                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                        borderColor: 'rgba(75, 192, 192, 1)',
                                        borderWidth: 1,
                                        type: 'line',
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

                        var tableColumns = response.table_columns;
                        var tableData = response.table_data;

                        // 표 헤더
                        var tableHeader = '<tr><th>구분</th>';
                        for (var i = 1; i < tableColumns.length; i++) {
                            tableHeader += '<th>' + tableColumns[i] + '</th>';
                        }
                        tableHeader += '</tr>';
                        $('#incidentTable thead').html(tableHeader);

                        // 표 본문
                        var tableBody = '';
                        for (var i = 0; i < tableData.length; i++) {
                            tableBody += '<tr>';
                            for (var j = 0; j < tableData[i].length; j++) {
                                tableBody += '<td>' + tableData[i][j] + '</td>';
                            }
                            tableBody += '</tr>';
                        }
                        $('#incidentTable tbody').html(tableBody);
                    },
                    error: function(error) {
                        console.log('Error:', error);
                    }
                });
            }

            // 큰 버튼 flask 주소, 데이터
            $('#timeIncidentBtn').click(function() {
                currentEndpoint = 'timeincident';
                console.log('timeincident 변경');
                selectedRegion = $('#region').val();
                getData(currentEndpoint, selectedRegion);
            });

            $('#weekIncidentBtn').click(function() {
                currentEndpoint = 'weekincident';
                console.log('weekincident 변경');
                selectedRegion = $('#region').val();
                getData(currentEndpoint, selectedRegion);
            });

            $('#weatherIncidentBtn').click(function() {
                currentEndpoint = 'weatherincident';
                console.log('weatherincident 변경');
                selectedRegion = $('#region').val();
                getData(currentEndpoint, selectedRegion);
            });

            // 자치구 조회
            $('#fetchData').click(function() {
                selectedRegion = $('#region').val();
                console.log('region:', selectedRegion);
                getData(currentEndpoint, selectedRegion);
            });

            // 초기 데이터
            console.log('region:', selectedRegion);
            getData(currentEndpoint, selectedRegion);
        });
    </script>
</body>
</html>
