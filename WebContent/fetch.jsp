<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>

<%

String friend=request.getParameter("friend");
String name,lat,lng;
try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		PreparedStatement ps = connection.prepareStatement(" select * from locations where user=?");
		ps.setString(1,friend);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			{
			lat=rs.getString("lat");
			lng=rs.getString("lng");
			name=rs.getString("name");
			out.println("skdhsa");
			RequestDispatcher rd = request.getRequestDispatcher("pointlocation.jsp?lat="+lat+"&&lng="+lng+"&&name="+name); 
			  rd.forward(request, response); 
			//response.sendRedirect("pointlocation.jsp?lat="+lat+"&&lng="+lng+"&&name="+name);
			}
		else
		{
			%>
			<script>
			alert("No location found!!!");
			</script>
			window.location="track.jsp";
			<%
		}
	
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	

%>







