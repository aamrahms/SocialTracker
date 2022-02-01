<%--@ page import="socket.Client1" --%>
<!DOCTYPE html>
<title>Location</title>
<html>
<head>
 <script type="text/javascript" src="script/jquery-1.11.3.js"></script>
<script type="text/javascript" src="headfoot.js"></script>
<style>
#map{
height:100%;
background-color:black;
}
html, body {
        height: 75%;
        width:99%;
        
      }
   
#win{
	color:red;
}
</style>
    </head>
<body><%
if(null == session.getAttribute("key"))
{
	%>
	<div id="header"></div>
	<% 
	}	
else
{
	%>
	<div id="sess"></div>
	
	<%
	
}

String user =(String)session.getAttribute("name");
String friend =request.getParameter("name");
String lat =request.getParameter("lat");
String lng =request.getParameter("lng");

//Client1 client=new Client1();
//double ret=client.clientCoord("12345");

%>

<div id="map"><div id="win"><div id="won"></div></div></div>

<script>

var lt=<%=lat%>;
var ln=<%=lng%>;
function initMap()
	{
		var map=new google.maps.Map(document.getElementById("map"),{
			zoom:15,			
		});
		var info = new google.maps.InfoWindow(document.getElementById("win"),{map: map});
		var info2 = new google.maps.InfoWindow(document.getElementById("won"),{map: map});
		if(navigator.geolocation)
			{
				navigator.geolocation.getCurrentPosition(function(position){
				var pos={lat:position.coords.latitude,lng:position.coords.longitude}
				var pos2={lat:lt,lng:ln};
				var marker = new google.maps.Marker({
			          map: map,
			          draggable:true,
			          animation:google.maps.Animation.DROP,
			          position: pos
			          
			    });
				var marker2 = new google.maps.Marker({
			          map: map,
			          draggable:true,
			          animation:google.maps.Animation.DROP,
			          position: pos2
			          
			    });
				google.maps.event.clearListeners(map);
			    marker.addListener('click', function(){
					map.setZoom(25);
				});
			    map.setCenter(new google.maps.LatLng(position.coords.latitude,position.coords.longitude));
			    info.setPosition(pos);
				info.setContent("<%=user%>");
				info.open(map, marker);
			    info2.open(map, marker2);
			    info2.setPosition(pos2);
				info2.setContent("<%=friend%>");
			    info2.open(map, marker2);
			    
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
	
	
	
	

</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDud6AuQ83g4dVhz7aA0eAa4RTNqWTLTLo&callback=initMap">
    </script></body>
</body>
</html>