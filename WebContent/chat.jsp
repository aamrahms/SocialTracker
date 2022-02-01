<%-- 
    Document   : chat
    Created on : Feb 23, 2017, 12:33:42 AM
    Author     : DELL
--%>

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
	background-color:rgb(64,64,64);
	width:100%;
	height:10%;
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
	position:relative;
	background-color:rgb(255,255,106);
	border:1px solid rgb(255,236,0);
	box-shadow:10px 10px 10px rgb(143,143,143);
}

.friend{
	float:left;
	clear:both;
	margin-left:20px;
	background-color:rgb(255,174,201);
	border:1px solid rgb(255,51,117);
	box-shadow:-6px 10px 10px rgb(143,143,143);
	
	
	
}
.date{
	color:rgb(20,9,168);
	font-size:15px;
	
}
footer{
	
	
	margin-top:50px;
	clear:both;
	

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
</head>
<body>
<header>


</header>
<section>
  <%
    String user = (String)request.getSession().getAttribute("user");
    String friend = request.getParameter("friend");
    Class.forName("com.mysql.jdbc.Driver") ;		
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
    Statement statement = connection.createStatement() ; 
    ResultSet resultset = null;
    out.println(user);
    out.println(friend);
    PreparedStatement ps = connection.prepareStatement(" select friend,message from chat where user = ? and friend = ?");
	ps.setString(1,user);
        ps.setString(2,friend);
	ResultSet rs = ps.executeQuery();
	ps.setString(1,user );
        ps.setString(2,friend);
while(rs.next())
{
    %>
    

<div class="user">
    
<br> <%=rs.getString("message")%>

<div class="date"><% 

%>
</div>
</div>

<div class="friend">
<br><%=rs.getString("message")%>
<div class="date"><% 
%>
</div>
</div>
<br>
<p>hiiiiiiii</p>
<form action="addMsg.jsp?user=<%=rs.getString("friend")%>&message=<%=rs.getString("message")%>" method="post">
	<textarea name="msg"  autofocus></textarea>
	<input type="submit" value="Send">
 <%} %>       
        
</form>
</section>
</body>
</html>
