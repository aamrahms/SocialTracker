<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<html>	
<body>

<%
String friend=request.getParameter("friend");
out.println(friend);
String user=(String)session.getAttribute("key");
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps1 = connection.prepareStatement("update friendlist set status=? where user=? and friend=?");
		ps1.setString(1,"on");
		ps1.setString(2,friend);
		ps1.setString(3,user);
		ps1.executeUpdate();
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





