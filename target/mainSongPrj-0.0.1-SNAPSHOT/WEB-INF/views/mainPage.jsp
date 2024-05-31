<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Accessible Map</title>
  <link rel="stylesheet" href="https://openlayers.org/en/v3.20.1/css/ol.css" type="text/css">
  <!-- 아래 줄은 Internet Explorer 및 Android 4.x와 같은 오래된 환경에서만 필요합니다 -->
  <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
  <script src="https://openlayers.org/en/v3.20.1/build/ol.js"></script>
  <style>
    a.skiplink {
      position: absolute;
      clip: rect(1px, 1px, 1px, 1px);
      padding: 0;
      border: 0;
      height: 1px;
      width: 1px;
      overflow: hidden;
    }
    a.skiplink:focus {
      clip: auto;
      height: auto;
      width: auto;
      background-color: #fff;
      padding: 0.3em;
    }
    #map:focus {
      outline: #4A74A8 solid 0.15em;
    }
  </style>
</head>
<body>
  <a class="skiplink" href="#map">지도로 이동</a>
  <div id="map" class="map" tabindex="0"></div>
  <button id="zoom-out">축소</button>
  <button id="zoom-in">확대</button>
  <script>
    var southKoreaExtent = ol.proj.transformExtent([124.6, 33.0, 131.9, 38.5], 'EPSG:4326', 'EPSG:3857');

    var map = new ol.Map({
      layers: [
        new ol.layer.Tile({
          source: new ol.source.OSM()
        })
      ],
      target: 'map',
      controls: ol.control.defaults({
        attributionOptions: /** @type {olx.control.AttributionOptions} */ ({
          collapsible: false
        })
      }),
      view: new ol.View({
        center: ol.proj.fromLonLat([127.8, 36.5]), // 한국 중심 좌표
        zoom: 7, // 적절한 줌 레벨 설정
        extent: southKoreaExtent,
        constrainResolution: true
      })
    });

    document.getElementById('zoom-out').onclick = function() {
      var view = map.getView();
      var zoom = view.getZoom();
      view.setZoom(zoom - 1);
    };

    document.getElementById('zoom-in').onclick = function() {
      var view = map.getView();
      var zoom = view.getZoom();
      view.setZoom(zoom + 1);
    };
  </script>
</body>


</html>