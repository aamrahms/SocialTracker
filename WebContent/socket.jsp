<%@page import="socket.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       Singleton s =new Singleton();
       chatserver2 c=new chatserver2();
      //c.server();
       int ret=s.createConn();
      
       out.println(ret);
       s.send("login");
        %>
        <h1>dfgdffdfh.............</h1>
    	<%
    		int cl=s.closeConn();
    		out.println(cl);
    		
    	%>
    </body>
</html>
