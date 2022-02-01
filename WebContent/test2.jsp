<!DOCTYPE html>
<html>
<head>
<style>
#map{
height:100%;
}
html, body {
        height: 75%;
        width:80%;
        margin: 0;
        padding: 0;
      }
p{
	height:40px;
	background-color:black;
}   
#win{
	color:red;
}
</style>
</head>
<body>
<%
String user =(String)session.getAttribute("key"); 
%>

<div id="map"><div id="win"></div></div>

<script>
	alert(<%=user%>);
	function initMap()
	{
		var map=new google.maps.Map(document.getElementById("map"),{
			zoom:10,			
		});
		var info = new google.maps.InfoWindow(document.getElementById("win"),{map: map,content:"<p></p>"});
		if(navigator.geolocation)
			{
				navigator.geolocation.getCurrentPosition(function(position){
				var pos={lat:position.coords.latitude,lng:position.coords.longitude}
				var marker = new google.maps.Marker({
			          map: map,
			          draggable:true,
			          animation:google.maps.Animation.DROP,
			          position: pos
			          
			    });
			    marker.addListener('click', toggleBounce);
			    map.setCenter(new google.maps.LatLng(position.coords.latitude,position.coords.longitude));
			    info.setPosition(pos);
				info.setContent("<%=user%>");
			    info.open(map, marker);
			}, function() {
	            handleLocationError(true, infoWindow, map.getCenter());
	          });
		}
		else {
	          // Browser doesn't support Geolocation
	          handleLocationError(false, infoWindow, map.getCenter());
	        }
	}
	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }
	function toggleBounce() {
        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      }
	

</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDud6AuQ83g4dVhz7aA0eAa4RTNqWTLTLo&callback=initMap">
    </script></body>
</body>
</html>