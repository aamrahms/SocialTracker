
<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<%

String user=(String)session.getAttribute("key");
String name=(String)session.getAttribute("name");
String msg=request.getParameter("msg");
String time=request.getParameter("time");
String date=request.getParameter("date");
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps1 = connection.prepareStatement("insert into forum (user,name,msg,time,date) values(?,?,?,?,?)");
		ps1.setString(1,user);
		ps1.setString(2,name);
		ps1.setString(3,msg);
		ps1.setString(4,time);
		ps1.setString(5,date);
		ps1.executeUpdate();	
	
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>

