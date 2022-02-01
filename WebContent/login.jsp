<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<%@ page import ="javax.servlet.http.HttpServlet.*"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*" %>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>


<%--= Class.forName("com.mysql.jdbc.Driver") --%>
<html>
<body>

<%

String username= request.getParameter("username") ;
Cookie uname = new Cookie("user",username);
String salt = "il!ke#0me$$w!#h#hec0de$!" ;
String password=request.getParameter("password");
uname.setMaxAge(60*60*24);
uname.setPath("/");
//out.print( DigestUtils.md5Hex( password ) );
 String digest = DigestUtils.md5Hex( password + salt ) ;//Calculates the MD5 digest and returns the value as a 32 character hex string.
String first;
 /*
if(username=="admin" && password== "@12@34")
{
       
}*/
try
{
	if(username=="admin")
	{
			out.println("dgsg");
	}
       Class.forName("com.mysql.jdbc.Driver") ;
       Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
    Statement statement = connection.createStatement() ;
    ResultSet rs ; 
    //out.println("query executed");
      ResultSet resultset = statement.executeQuery(" select * from recs where username='"+username+"'and digest='"+digest+"'" ) ; 
     
      //if a row exists
      
      if (resultset.next())
     	{
    	  first=resultset.getString("first");
   	  	  rs = statement.executeQuery(" select * from recs where username='admin' and digest='"+digest+"'" ) ; 
   		   if(rs.next())
   	 		 {
   				session=request.getSession();
   				session.setAttribute("key", username);
   				response.addCookie(uname);
   				session.setAttribute("name",first);
   				response.sendRedirect("admin.jsp");
					
			}
				else{
					
					
					session=request.getSession();
					session.setAttribute("key", username);
					session.setAttribute("name",first);
					response.addCookie(uname);
					%>
					<script>
					alert("LOGGED IN");
					
					</script>
					<%
					response.sendRedirect("home.jsp");
						
					}
							
   		   }
         
         
         
   	   
      else if (username == "admin")
      {
    	  %>
			<script>
   	  alert("YOU ARE NOT THE ADMIN! ");
   	  window.location.href="try.jsp";
   	  </script>
    		 <%
    	  } 
       else
       {
    	   %>
			<script>
   	   alert("INCORRECT USERNAME or PASSWORD! ");
   	   window.location.href="try.jsp";
      
     		 </script>
     	 <%
   }
     
     resultset.close() ;

}
catch(Exception e)
{
       e.printStackTrace(); 
}

%>


</body>
</html>
