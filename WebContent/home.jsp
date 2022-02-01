<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<DOCTYPE HTML!>
<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript" src="script/jquery-1.11.3.js"></script>
	<title>social tracker</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style> 	body{
background-image:url(pics/cc.jpg);
background-color: #DDDDDD;
}
.button {
background-image: -moz-linear-gradient(top, #FFFF00, #FFFFFF);
background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0.00, #FFFF00), color-stop(1.0, #FFFFFF));
background-color: #DDDDDD; 
color:black;
   text-align: center;
    display: inline-block;
    font-size: 18px;
	height: 200px;
	width: 200px;
	line-height: 1.428571429;
  	border-radius: 100%;
	font-family: Barrio;
	shadow: 10px 10px 5px #888888;
}
li{
	color: blue;
}
</style>

<script type="text/javascript">
	function add()
	{
		if(window.navigator.geolocation)
		{
			var myGeoloc = window.navigator.geolocation;
			
			options = {
					enableHighAccuracy: true,
					maximumAge: 5000,
					timeout: 5000
				}
			myGeoloc.getCurrentPosition(succesHandler);
			
			function succesHandler(position)
			{
				//document.getElementById("demo").innerHTML ="Current Latitude: " + position.coords.latitude + " Current Longitude: " +position.coords.longitude;
				var xhttp = new XMLHttpRequest();
				//alert("abc");
				str="addLoc.jsp?lat="+position.coords.latitude+"&&lng="+position.coords.longitude;
				//alert(str);
				xhttp.onreadystatechange = function()
				{
	
					if (this.readyState == 4 && this.status == 200) 
				     {
						
				     }
				}
				xhttp.open("POST",str, true);
				xhttp.send();
			}
		}
				
		
	}
</script>
</HEAD>
<header>
<% 
String user =(String)session.getAttribute("key");
String f,name;
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps1 = connection.prepareStatement("select* from friends where user=?");
		ps1.setString(1,user);
		ResultSet rs=ps1.executeQuery();
		
			
			%>
	<div class="jumbotron">
		<a href="try.jsp"><p style="font-color:black; text-align:center;"><img src="pics/cooltext236040979457189.png"/></a>
		 <ul class="nav navbar-nav navbar-right">
		 <li>
		 	<div class="dropdown">
    			<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Notification
    			<span class="caret"></span></button>
    			<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
    			<%
    			while(rs.next())
				{
					f=rs.getString("friend");
					name=rs.getString("fname"); %>
					<li><%=name %></li>
      				<li><a href="allow.jsp?friend=<%=f%>"><button>Accept</button></a></li>
      				
		 		<%} %>
		 		</ul>
		 	</div>
		 <li>
            <%
   				Cookie cookie = null;
   				Cookie[] cookies= null;
   				cookies = request.getCookies();
   				if( cookies != null ){
   				out.print("Hello ");
      			for (int i = 0; i < cookies.length; i++){
         			cookie = cookies[i];
         			 if(cookie.getName().equals("user"))
         				 {
         				 	//out.print(cookie.getValue());
         				 }
      			}
  			}
   				out.println(user);
			%>
		 </li>
		 
		 
		 <li>
		 		<a href="logout.jsp"><span class="glyphicon glyphicon-off" style="color:black;margin-right:10px;margin-top:-10px"></span></a>
		 </li>
        </ul>
	</div>
</header>
<BODY onload="add()">
<div id="demo"></div>
<div class="container-fluid">
	
	<div class="row">
<a href="chatDis.jsp">
    	<div class="col-sm-4 col-md-6">
      		<div class="flip-container" ontouchstart="this.classList.toggle('hover');" >
	<div class="flipper">
		<div class="front">
			<button class="button" style="font-size:27px">Chat</button>
		</div>
		<div class="back">
			<button class="button" href="chatDis.jsp">Interact with your friends by exchanging messages</button>
		</div>
	</div>
</div>
    	</div>
    	</a>
    	<a href="track.jsp"><div class="col-sm-4 col-md-6" ">
      		<div class="flip-container" ontouchstart="this.classList.toggle('hover');" >
	<div class="flipper">
		<div class="front">
			<button class="button" style="font-size:27px">Track a friend</button>
		</div>
		<div class="back">
			<button class="button">Search your friends faster.Just request for permission</button>
		</div>
	</div>
</div>
    	</div>
  </div>
</div></a>
<a href="forum.jsp"><div class="container-fluid">
	<div class="row">
    	<div class="col-sm-4 col-md-6">
      		<div class="flip-container" ontouchstart="this.classList.toggle('hover');" >
	<div class="flipper">
		<div class="front">
			<button class="button" style="font-size:27px">Forum</button>
		</div>
		<div class="back">
			<button class="button">Where all your problems can find a solution.</button>
		</div>
	</div>
</div>
    	</div>
</a>
<a href="addFriend.jsp">
    	<div class="col-sm-4 col-md-6" ">
      		<div class="flip-container" ontouchstart="this.classList.toggle('hover');" >
	<div class="flipper">
		<div class="front">
			<button class="button" style="font-size:27px">Add a friend</button>
		</div>
		<div class="back">
			<button class="button" href=>Make your experience interesting by adding your friends.</button>
		</div>
	</div>
</div>
    	</div>
  </div>
</div>
</a>
<footer>
	<p style="background-color: grey;font-color:black; text-align:center">Stay social stay connected</p>
</footer>
<%
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>
</BODY>
