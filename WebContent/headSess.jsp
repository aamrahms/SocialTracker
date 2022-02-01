<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<head>
  <title>Social Tracker</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="style" href="style.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
<% 
String user =(String)session.getAttribute("name");
String f,name;
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps1 = connection.prepareStatement("select* from friends where user=?");
		ps1.setString(1,user);
		ResultSet rs=ps1.executeQuery();
		
			
			%>
<div class="jumbotron" style="background-image:url(pics/Preview_Map.jpg);">
		<a href="home.jsp"><p style="font-color:black; text-align:center;"><img src="pics/cooltext236040979457189.png"/></a>
		 <ul class="nav navbar-nav navbar-right">
           
		 	 <li style="color:black;margin-right:20px;margin-top:10px;color:blue;font-size:20px"><b>
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
		 </b></li>
		 
		 
		 <li>
		 		<a href="logout.jsp"><span class="glyphicon glyphicon-off" style="color:black;margin-right:10px;margin-top:-10px"></span></a>
		 </li>
        </ul>
	</div>
	<%
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>
	</body>

