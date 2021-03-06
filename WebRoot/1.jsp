<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>逆地理编码</title>
<link rel="stylesheet"
	href="http://cache.amap.com/lbs/static/main1119.css" />
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=34b01e8c28c4fe9377892812abcc61df&plugin=AMap.Geocoder"></script>
<script type="text/javascript"
	src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>
<body onload="regeocoder()">
	<div id="container"></div>
	<div id="tip">
		<b>经纬度 116.396574, 39.992706 的地理编码结果:</b> <span id="result"></span>
	</div>
	<script type="text/javascript">
    var map = new AMap.Map("container", {
        resizeEnable: true,
		zoom: 18
    }),    
    lnglatXY = [113.346055, 23.146613]; //已知点坐标
    function regeocoder() {  //逆地理编码
        var geocoder = new AMap.Geocoder({
            radius: 1000,
            extensions: "all"
        });        
        geocoder.getAddress(lnglatXY, function(status, result) {
            if (status === 'complete' && result.info === 'OK') {
                geocoder_CallBack(result);
            }
        });        
        var marker = new AMap.Marker({  //加点
            map: map,
            position: lnglatXY
        });
        map.setFitView();
    }
    function geocoder_CallBack(data) {
        var address = data.regeocode.formattedAddress; //返回地址描述
        document.getElementById("result").innerHTML = address;
    }
</script>


</body>
</html>
