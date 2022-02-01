<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<html>	
<body>

<%
String friend=request.getParameter("friend");

String user=(String)session.getAttribute("key");
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps2 = connection.prepareStatement("delete from friends where user=? and friend=?");
		ps2.setString(1,user);
		ps2.setString(2,friend);
		ps2.executeUpdate();
		response.sendRedirect("home.jsp");
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>


</body>
</html>
</html>





