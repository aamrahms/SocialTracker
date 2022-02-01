<%-- 
    Document   : chatstore
    Created on : Apr 13, 2017, 12:13:18 AM
    Author     : DELL
--%>


<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<%

String user=(String)session.getAttribute("key");
String friend=(String)session.getAttribute("friend");
String message=request.getParameter("message");
String time=request.getParameter("time");
//String date=request.getParameter("date");
try
	{	%>
		<script>
		alert(date);
                alert(xyyyy);
		</script>
		<%
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps1 = connection.prepareStatement("insert into chat values(?,?,?,?)");
			ps1.setString(1,user);
			ps1.setString(2,friend);
			ps1.setString(3,message);
			ps1.setString(4,time);
			//ps1.setString(5,date);
			ps1.executeUpdate();
		
		
		
	
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>


