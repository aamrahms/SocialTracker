<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<html>	
<body>

<%

String user=request.getParameter("f");
String friend=(String)session.getAttribute("key");
String fname=(String)session.getAttribute("name");
out.println(friend);
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps = connection.prepareStatement("select * from friends where user=? and friend=?");
		ps.setString(1,user);
		ps.setString(2,friend);
		ResultSet rs=ps.executeQuery();
		if(!rs.next())
		{
			PreparedStatement ps1 = connection.prepareStatement("insert into friends (user,friend,fname) value(?,?,?)");
			ps1.setString(1,user);
			ps1.setString(2,friend);
			ps1.setString(3,fname);
			ps1.executeUpdate();
			PreparedStatement ps2 = connection.prepareStatement("insert into friendlist (user,friend,status) value(?,?,?)");
			ps2.setString(1,friend);
			ps2.setString(2,user);
			ps2.setString(3,"off");
			ps2.executeUpdate();
			out.println(friend);
		}
		
		response.sendRedirect("track.jsp");		
	
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>


</body>
</html>
</html>





