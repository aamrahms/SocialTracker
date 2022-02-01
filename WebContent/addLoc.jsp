
<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<%

String user=(String)session.getAttribute("key");
String name=(String)session.getAttribute("name");
String lat = request.getParameter("lat");
String lng = request.getParameter("lng");
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps = connection.prepareStatement("select * from locations where user=?");
		ps.setString(1,user);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			PreparedStatement ps2 = connection.prepareStatement("update locations set lat=?, lng=? where user=? ");
			ps2.setString(3,user);
			ps2.setString(1,lat);
			ps2.setString(2,lng);
			ps2.executeUpdate();
		}
		else
		{
			PreparedStatement ps1 = connection.prepareStatement("insert into locations (user,lat,lng,name) value(?,?,?,?)");
			ps1.setString(1,user);
			ps1.setString(2,lat);
			ps1.setString(3,lng);
			ps1.setString(4,name);
			ps1.executeUpdate();
		}
		
		
	
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>


