<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chat</title>
<script type="text/javascript" src="chat.js" ></script>
<script type="text/javascript" src="script/jquery-1.11.3.js"></script>

<style>
body{
	overflow:none;
        
}
header{
	display:block;
	background-color: cadetblue;
	width:100%;
	height:10%;
        text-align: left;
       
        
}
.u,.her{
	font-family:Lucida Handwriting;
	font:bold;
	color:black;
	border-radius:5px;
	padding:20px;
	margin-top:30px;
	border:1px solid rgb(69,12,55);
	
	position:relative;
}
.user{

	float:right;
	clear:both;
	text-align:right;
	margin-right:20px;
        margin-bottom: 20px;
	position:relative;
	background-color:rgb(255,255,106);
	border:1px solid rgb(255,236,0);
	box-shadow:10px 10px 10px rgb(143,143,143);
}

.friend{
	float:left;
	clear:both;
	margin-left:20px;
	 margin-bottom: 20px;
	background-color:rgb(255,174,201);
	border:1px solid rgb(255,51,117);
	box-shadow:-6px 10px 10px rgb(143,143,143);
	
	
	
}
.date{
	color:rgb(20,9,168);
	font-size:15px;
	
}
footer{
	
	position: fixed;
	margin-bottom:5px;
	clear:both;
	height:35%;
}
textarea{
	box-shadow:0px 1px 10px  rgb(54,39,243);
	clear:left;
	width:93%;
	height:20%;
	display:inline-block;
}
input[type="submit"]{
	margin:10px;
	float:right;
	width:60px;
	height:40px;
	box-shadow:0px 1px 10px  rgb(54,39,243);
	
}
section{
	height:59%;
        
}


</style>
<script>
	function add()
	{
		var text=getElementByTag("textarea");	
		out.println(text.value());
	}
</script>



<script>
	function append()
	{
		str=document.getElementById("rev").value;
        document.getElementById("rev").value="";
		d=new Date();
		var xhttp = new XMLHttpRequest();	 
		m=d.getMonth()+1;
		link="chatstore.jsp?message="+str+"&&time="+d.getHours()+":"+d.getMinutes();
        xhttp.onreadystatechange = function()
		{
			
			if (this.readyState == 4 && this.status == 200) 
		     {
				
		     }
		}
		xhttp.open("POST",link,true);
		xhttp.send();
		        window.location.reload();

		
	}
	   
	function div()
	{
		str=document.getElementById("rev").value;
		var div = document.createElement('div');
		div.innerHTML = xhttp.responseText;
		document.getElementByTagName('feedback').appendChild(div);
	}
</script>
<script>
$(document).ready(function(){
	   setTimeout(function(){
		window.location.reload();   
	   },9500);
	});
</script>
<script>
    // Run on page load
    window.onload = function() {
    	element = document.getElementByTagName("body");
    	element.scrollTop = element.scrollHeight;
        var name = sessionStorage.getItem('name');
        if (name !== null) $('#rev').val(name);
    }

    // Before refreshing the page, save the form data to sessionStorage
    window.onbeforeunload = function() {
        sessionStorage.setItem("name", $('#rev').val());
        //sessionStorage.setItem("name", $('body').val());
        
    }
</script>
</head>
<body style="height :100%; width:100%">
<header style="position:absolute ; top:0px;height:100px;overflow:hidden;">
    <h1>
     &nbsp 
    <%
     String first = request.getParameter("friend");
    out.println(first);
    %>
    </h1>
	<a href="home.jsp"><img src="pics/home-icon.png" style="float:right; height:30px;width:30px"/></a>
</header>
<body>

<section style="position:absolute ; top:100px;bottom:220px;left:0px;right:0px;overflow:auto;">
  <%
   	String user = (String)session.getAttribute("key");
    String friend = request.getParameter("friend");
    session=request.getSession();
    session.setAttribute("friend",friend);
    Class.forName("com.mysql.jdbc.Driver") ;		
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
    Statement statement = connection.createStatement() ; 
    ResultSet resultset = null;
    PreparedStatement ps = connection.prepareStatement(" select user,friend,message,time from chat where user = ? and friend = ? OR user = ? and friend = ?");
	ps.setString(1,user);
    ps.setString(2,friend);
    ps.setString(3,friend);
    ps.setString(4,user);
	ResultSet rs = ps.executeQuery();
    
while(rs.next())
{
    %>

    <% if((rs.getString("user")).equalsIgnoreCase(user))
           {
            %>
<div class="user">
    
<br> &nbsp<%=rs.getString("message")%>&nbsp&nbsp
&nbsp &nbsp &nbsp
    <%=rs.getString("time")%>&nbsp
    <br>
    
</div>
<% 
    }
    
    else
               {
%>

<div class="friend">
<br>&nbsp <%=rs.getString("time")%>&nbsp&nbsp
&nbsp &nbsp &nbsp

<%=rs.getString("message")%>&nbsp
<br>
<div class="date"><% 
    }
%>
</div>
</div>


</div>
</div>
<br>
<br>
<%
 }  
%>
<p></p>
</section>
<footer style="position:fixed ; top:600px;bottom:0px;left:0px;right:0px;overflow:hidden;">

	<textarea id="rev" onblur="div()"></textarea>
	<button onclick="append()">SEND</button>
</footer>> 
 
</body>
</html>
.