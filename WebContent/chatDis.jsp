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
int count;
Class.forName("com.mysql.jdbc.Driver") ;		
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");  	
PreparedStatement statement = null;
    ResultSet resultset = null;
    String user=(String)session.getAttribute("key");
   // out.println(user);
    PreparedStatement ps = connection.prepareStatement(" select *from friendlist,recs where user = ? and friendlist.user=recs.username order by friend asc");
	ps.setString(1,user);
	ResultSet rs = ps.executeQuery();
	ps.setString(1,user );
 count=1;
 %>
<h2 style="text-align:center">Chat with FRIEND</h2>
<% while (rs.next()){

if(count%4==0){ %>
<br>
<br>
   
<%
}
else{
		//out.println("hagahdhk");%>



<div class="columns">
  <ul class="price">
     <li><img src="pics/<%=rs.getString("img")%>"/></li>
    <li class="grey"><%=rs.getString("friend")%></li>
    <li class="grey"><a href="chat1.jsp?friend=<%=rs.getString("friend")%>" class="button">Chat</a></li>
  </ul>
  <% count++;
  %>
</div>
<%
}
}
%>
</body>
</html>
