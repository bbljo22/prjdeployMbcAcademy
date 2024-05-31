<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>교통사고 정보 선택</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
  </head>
  
  <body>
  <h1>교통사고 분포도</h1>
  
	<div class="">
	 <select id="selectData">
	      <option value="2018">사망교통사고정보_2018</option>
	      <option value="2019">사망교통사고정보_2019</option>
	      <option value="2020">사망교통사고정보_2020</option>
	      <option value="2021">사망교통사고정보_2021</option>
	      <option value="2022">사망교통사고정보_2022</option>
	    </select>
	</div>
   
    <div id="map" style="width: 150px; height: 150px"></div>
    	
    <a href="" id="myLink"></a>
    <script>
      $(document).ready(function(){
        $('#selectData').change(function() {
          var selectedValue = $(this).val();
          console.log("Selected value:", selectedValue);
          var endpoint = 'seoul'
          
          $.ajax({
            url: 'http://127.0.0.1:5000/' + endpoint,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ data: selectedValue }),
            success: function(response) {
              console.log('Response:', response);
              var loc = "resources/"+selectedValue+ ".html"
              console.log(loc)
              window.location.href = loc
            }
          });
        });
      });
    </script>
  </body>
</html>

