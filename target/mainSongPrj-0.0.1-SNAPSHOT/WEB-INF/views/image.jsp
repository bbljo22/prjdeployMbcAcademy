<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- HTML 파일 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>지도 데이터 예제</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
        #map { height: 600px; width: 100%; }
    </style>
</head>
<body>
    <h1>DataFrame에서 데이터 가져오기</h1>
    <div id="map"></div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script>
        $(document).ready(function() {
            $.ajax({
                url: '/data_flask',
                type: 'GET',
                success: function(response) {
                    var data = response.results;
                    var map = L.map('map').setView([37.53897093698831, 127.05461953077439], 11);
                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        maxZoom: 19
                    }).addTo(map);

                    data.forEach(function(item) {
                        var marker = L.marker([item.y, item.x]).addTo(map);
                        marker.bindPopup(item.popup);
                        marker.bindTooltip(item.tooltip);
                    });

                    var style = document.createElement('style');
                    style.innerHTML = `
                    .leaflet-popup-content-wrapper {
                        width: 300px;
                    }
                    `;
                    document.head.appendChild(style);
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
        });
    </script>
</body>
</html>
