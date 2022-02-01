<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>

<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="script/jquery-1.11.3.js"></script>
<script type="text/javascript" src="headfoot.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
* {
    box-sizing: border-box;
}

.columns {
    float: left;
    width: 33.3%;
    padding: 8px;
    display:block;
}

.des {
    list-style-type: none;
    border: 1px solid #eee;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
   }

.des:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.des .header {
    background-color: grey ;
    color: white;
    font-size: 20px;
}

.des li {
    border-bottom: 1px solid #eee;
    padding: 20px;
    text-align: center;
}

.des .grey {
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
<header><%
if(null == session.getAttribute("key"))
{
	%>
	<div id="header"></div>
	<% 
	}	
else
{
	%>
	<div id="sess"></div>
	
	<%
	
}
%>
</header>
<%
int count;
String user1=(String)session.getAttribute("key");
Class.forName("com.mysql.jdbc.Driver") ;		
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
PreparedStatement ps1 = connection.prepareStatement("select * from recs where username not in (?) order by first asc");
ps1.setString(1,user1);

ResultSet rs = ps1.executeQuery() ;
 count=1;
 %>
<h2 style="text-align:center">TRACK YOUR FRIEND</h2>


<%count=1;
while(rs.next())
{
	
	count=count%3;
	if(count==0){
	 %>

<div class="columns">
  <ul class="des">
    
     <li><img src="pics/<%=rs.getString("img")%>"/></li>
    <li class="header"><%=rs.getString("first")%> <%=rs.getString("last")%></li>
    <li class="grey"><%=rs.getString("username")%></li>
    <li class="grey"><a href="permission.jsp?friend=<%=rs.getString("username")%>" id="friend" class="button">TRACK</a></li>ii
  </ul>
  <% count++; %>
</div>
<% }else if(count==1){ %>
<div class="columns">
  <ul class="des">
     <li><img src="pics/<%=rs.getString("img")%>"/></li>
    <li class="header" style="background-color:#4CAF50"><%=rs.getString("first")%> <%=rs.getString("last")%></li>
    <li class="grey"><%=rs.getString("username")%></li>
    <li class="grey"><a href="permission.jsp?friend=<%=rs.getString("username")%>" class="button">TRACK</a></li>
  </ul>
  <% count++; %>
</div>
<%  }else if(count==2){ %>
<div class="columns">
  <ul class="des">
     <li><img src="pics/<%=rs.getString("img")%>"/></li>
    <li class="header" style="background-color: yellow; opacity:0.5"><%=rs.getString("first")%> <%=rs.getString("last")%></li>
    <li class="grey"><%=rs.getString("username")%></li>
    <li class="grey"><a href="permission.jsp?friend=<%=rs.getString("username")%>" class="button">TRACK</a></li>
  </ul>
  <%  count++;}
  %>
</div>
<%
}

%>
</body>
</html>
