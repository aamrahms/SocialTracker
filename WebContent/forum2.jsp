<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<html>	
<head>
 <script type="text/javascript" src="script/jquery-1.11.3.js"></script>
<script type="text/javascript" src="headfoot.js"></script>
<script>
	function append()
	{
		str=document.getElementById("rev").value;
		d=new Date();
		var xhttp = new XMLHttpRequest();
		
		 
		m=d.getMonth()+1;
		link="addrev.jsp?msg="+str+"&time="+d.getHours()+":"+d.getMinutes()+"&date="+d.getDate()+"/"+m+"/"+d.getFullYear();
		xhttp.onreadystatechange = function()
		{
			if (this.readyState == 4 && this.status == 200) 
		     {
				alert("here");
						     }
			
		}
		//alert("abc");
		xhttp.open("POST",link,true);
		//alert("xyz");
		xhttp.send();
		//alert("123");
		window.location.reload();
				var para = document.createElement("div");
				para.className("full");
				var node = document.createTextNode(str);
				para.appendChild(node);
				var element = document.getElementById("feedback");
				element.appendChild(para);
				alert("out");

	}
	function div()
	{
		str=document.getElementById("rev").value;
		
	}
</script>
<style>
.full{
}
.revs{
	-webkit-border-radius: 8px;
-moz-border-radius: 8px;
border-radius: 8px;
-webkit-box-shadow: 5px 5px 5px #808080;
-moz-box-shadow: 5px 5px 5px #808080;
box-shadow: 5px 5px 5px #808080;
text-shadow: 2px 2px 0px #FFFFFF;
background-image: -moz-linear-gradient(225deg, #808080, #D3D3D3 53%);
background-image: -moz-linear-gradient(-45deg, #808080, #D3D3D3 53%);
background-image: -webkit-gradient(linear, left top, right bottom, color-stop(0.00, #808080), color-stop(0.53, #D3D3D3));
border: 1px solid #C0C0C0;
background-color: #FFA500;
padding: 10px;
font-family: Verdana, Geneva, sans-serif;
font-size: 12pt;
color: #191970;
/*text-align: center;
	*/
	float:left;
	position:relative;
	margin-left:20px;
	margin-bottom:20px;
/*	background-color:rgb(255,174,201);
	border:1px solid rgb(255,51,117);
	box-shadow:-6px 10px 10px rgb(143,143,143);
	*/width:75%;
	padding:20px;
	
}
textarea{
	box-shadow:0px 1px 10px  rgb(54,39,243);
	width:93%;
	height:20%;
	display:inline-block;
	margin-bottom:50px;
	clear:both;
	
}
footer{
margin-bottom:5px;
	clear:both;
	height:35%;
}
.feedback{
height:70%;

}
.click{
margin-right:20px;
}
</style>
</head>
<body style="height :100%; width:100%">
<header style="position:absolute ; top:0px;height:200px;width:100%;overflow:hidden;"><%
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
%>
</header>
<section style="position:absolute ; top:200px;bottom:150px;left:0px;right:0px;overflow:auto;">
<div id="feedback" >
<%

try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps = connection.prepareStatement("select * from forum");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			%>
				
				<div class=revs><b><%= rs.getString("name")%></b><br><%= rs.getString("msg")%><div style="float:right"><%= rs.getString("time")%></div></div>
				
				
			<%		
		}
		
		
	
%>
	
	</div>
	</section>
	<footer style="position:fixed ; top:600px;bottom:0px;left:0px;right:0px;overflow:hidden;">
	<textarea id="rev"></textarea>
	<button id="click" onclick="append()">Give<br>Feedback</button> </footer>
<%	
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>


</body>
</html>
</html>





