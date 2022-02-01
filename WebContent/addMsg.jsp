<%-- 
    Document   : tacker1
    Created on : Feb 23, 2017, 12:38:36 AM
    Author     : DELL
--%>

<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
    box-sizing: border-box;
}

.columns {
    float: left;
    width: 33.3%;
    padding: 8px;
}

.price {
    list-style-type: none;
    border: 1px solid #eee;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
}

.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.price .header {
    background-color: grey ;
    color: white;
    font-size: 20px;
}

.price li {
    border-bottom: 1px solid #eee;
    padding: 20px;
    text-align: center;
}

.price .grey {
    background-color: lightblue;
    font-size: 15px;
}

.button {
    background-color: #FFDAB9;
    border: 2px solid lightblue;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
}

@media only screen and (max-width: 600px) {
    .columns {
        width: 100%;
    }
}
</style>
</head>
<body>
<%
    String user = (String)request.getSession().getAttribute("user");
    String friend = request.getParameter("friend");
    String message = request.getParameter("message");
    Class.forName("com.mysql.jdbc.Driver") ;		
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");  	
    PreparedStatement statement = null;
    ResultSet resultset = null;
    out.println(user);
    PreparedStatement ps = connection.prepareStatement(" insert into chat values(? , ? , ?)");
	ps.setString(1,user);
	ps.setString(2,friend );
	ps.setString(3,message);
        ResultSet rs = ps.executeQuery();
        response.sendRedirect("chat.jsp");
 %>

</body>
</html>
