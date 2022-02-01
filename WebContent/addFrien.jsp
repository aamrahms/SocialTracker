
<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<%@ page import ="javax.servlet.http.HttpServlet.*"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*" %>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>

<html>	
<body>

<%

String user=(String)session.getAttribute("key");
String friend = request.getParameter("friend");
out.println(friend);
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		out.println(friend);
		PreparedStatement ps = connection.prepareStatement("select * from friendlist where user=? and friend=?");
		ps.setString(1,user);
		ps.setString(2,friend);
		ResultSet rs=ps.executeQuery();
		if(!rs.next())
		{
			PreparedStatement ps1 = connection.prepareStatement("insert into friendlist (user,friend,status) value(?,?,?)");
			ps1.setString(1,user);
			ps1.setString(2,friend);
			ps1.setString(3,"off");
			ps1.executeUpdate();
		}
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





