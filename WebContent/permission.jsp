
<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<html>

<body>
<%
String user;
String status;
String f=request.getParameter("friend");
Cookie cookie = null;
	Cookie[] cookies= null;
	cookies = request.getCookies();
	if( cookies != null ){
		for (int i = 0; i < cookies.length; i++)
		{
			if(cookies[i].getName().equals("user"))
			{
				cookie = cookies[i];
			}
		
		}
	}
%>

<%
try
	{
	user=cookie.getValue();
	
	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		Statement statement = connection.createStatement() ;
		PreparedStatement ps = connection.prepareStatement(" select * from friendlist where user=? and friend=?");
		ps.setString(1,user);
		ps.setString(2,f);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())
		{
			out.println("here");
			Cookie uname = new Cookie("friend",f);
			response.addCookie(uname);
			status=rs.getString("status");
			if(status.equals("on"))
			{
								
				response.sendRedirect("fetch.jsp?friend="+f);
			
			}
			else if(status.equals("off"))
			{
				%>
				<script>
					r=confirm("Do you want to resend request for tracking?");
					if(r==true)
						{
						alert("Request send!!!");
						//out.println(user+friend);
						window.location="askPerm.jsp?f=<%=f%>";
						}
					else
						{
							alert("you cant track this person!!");
							//response.sendRedirect("track.jsp");
							window.location="track.jsp";
						}
				</script>
			<%
			}
		}	
		else
		{
			%>
				<script>
					r=confirm("Do you want to send request for tracking?");
					if(r==true)
						{
						alert("Request send!!!");
						//out.println(user+friend);
						window.location="askPerm.jsp?f=<%=f%>";
						}
					else
						{
							alert("you cant track this person!!");
							//response.sendRedirect("track.jsp");
							window.location="track.jsp";
						}
				</script>
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