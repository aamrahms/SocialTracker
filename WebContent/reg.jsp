
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
String firstname = request.getParameter("first");
String lastname =request.getParameter("last") ;
String date= request.getParameter("date") ;
//String month= request.getParameter("month") ;
//String year= request.getParameter("year") ;
String email= request.getParameter("email") ;
String contact= request.getParameter("contact");
String username =request.getParameter("username");
Cookie uname = new Cookie("username",request.getParameter("username"));
response.addCookie(uname);
String salt = "il!ke#0me$$w!#h#hec0de$!" ;
String password=request.getParameter("password");

 String digest = DigestUtils.md5Hex( password + salt ) ;//Calculates the MD5 digest and returns the value as a 32 character hex string.

out.print(firstname+lastname+date+email+contact+username+digest);
	try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		Statement statement = connection.createStatement() ;
		ResultSet rs ;
		out.print("b4 resultset");
		ResultSet resultset = statement.executeQuery(" select * from recs where username='"+username+"'" ) ;  
		out.print("after resultset");
		if(resultset.next())
		{
			out.print("if user exists");
			
			%>
			 <script>
			 	alert("USERNAME ALREADY EXISTS!<b> GO BACK AND TRY ANOTHER!");
			 	window.location.href="reg.html";
			 	
			 </script>
			  <%
		}
		else 
		{ 
			out.print("you are a new user");
			out.print("next stat is insert");
			PreparedStatement ps1 = connection.prepareStatement("insert into recs (first,last,dob,email,contact,username,digest) values(?,?,?,?,?,?,?)");
			ps1.setString(1,firstname);
			ps1.setString(2,lastname);
			ps1.setString(3,date);
			ps1.setString(4,email);
			ps1.setString(5,contact);
			ps1.setString(6,username);
			ps1.setString(7,digest);
			ps1.executeUpdate();
			out.print("inserted" );
			session=request.getSession();
			session.setAttribute("key", username);
			
			%>
			 <script>
			 	alert("YOU ARE NOW REGISTERdED!");
			 <%	
			 	response.sendRedirect("home.jsp");
   			
			 	//window.location.href="try.html";
			%> 	</script>
		 	 <%
		}
	
	
	}
	catch (Exception e)
	{
		out.println(e);
		//e.printStackTrace();
	}
	

%>


</body>
</html>
</html>





