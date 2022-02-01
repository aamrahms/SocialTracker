
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

//out.print( DigestUtils.md5Hex( password ) );
 String digest = DigestUtils.md5Hex( password + salt ) ;//Calculates the MD5 digest and returns the value as a 32 character hex string.
 //out.print( digest+"<br>" );
	try
	{	
		Class.forName("com.mysql.jdbc.Driver") ;
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
		Statement statement = connection.createStatement() ;
		ResultSet rs ;
		ResultSet resultset = statement.executeQuery(" select * from recs where username='"+username+"'" ) ;  
		if(resultset.next())
		{
			%>
			 <script>
			 	alert("USERNAME ALREADY EXISTS!<b> GO BACK AND TRY ANOTHER!");
			 	window.location.href="reg.html";
			 	
			 </script>
			  <%
		}
		else 
		{ 
			int i=statement.executeUpdate("insert into recs (first,last,dob,email,contact,username,digest)" + "values('"+firstname+"' , '"+lastname+"' ,'"+date+"' , '"+ email+"' , '"+contact+"' , '"+username+"' , '"+ digest+"')"); //first,last,date,email,contact,username,password //out.println("1123") ; 
			out.print("khxhdxgk" );
			%>
			 <script>
			 	alert("YOU ARE NOW REGISTERED!");
			 <%	
			 	response.sendRedirect("home.jsp");
   			
			 	//window.location.href="try.html";
			%> 	</script>
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





