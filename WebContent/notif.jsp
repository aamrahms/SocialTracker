<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<html>	
<body>

<%
String f,name;
String user="aam";//(String)session.getAttribute("key");
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps1 = connection.prepareStatement("select* from friends where user=?");
		ps1.setString(1,user);
		ResultSet rs=ps1.executeQuery();
		while(rs.next())
		{
			f=rs.getString("friend");
			name=rs.getString("fname");
			%>
			<%=name %>
			<a href="allow.jsp?friend=<%=f%>"><button>Accept</button></a>
			<%
		}
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>


</body>
</html>
</html>





