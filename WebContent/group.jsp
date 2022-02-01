<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="headfoot.js"></script>
<style>
.user {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    border: 2px solid #111111;
    transition: 0.3s;
    width: 350px;
    border-radius: 5px;
    text-align: center;
    line-height: 0%;
}

.user:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.5);
}

img {
    border-radius: 5px 5px 5px 5px  ;
}

.container {
    padding: 1px 6px;
}


input[type=text] {
    width: 250px;
    box-sizing: border-box;
    border: 2px solid #000000;
    border-radius: 4px;
    font-size: 16px;
    background-color: light-blue;
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 70%;
}
	
</style>
</head>
<body>
<div id="header"></div>
<%
Class.forName("com.mysql.jdbc.Driver") ;		
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
Statement statement = connection.createStatement() ;  	
ResultSet rs = statement.executeQuery(" select * from recs order by first asc") ;
  %>


<h2 style="text-align: center;">CREATE GROUP</h2>

<i class="glyphicon glyphicon-search"></i><input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Friends.." title="Type in a friend's name">
<br>
<br>
<br>
<% while(rs.next()){%>
<input type =checkbox >
<div class="user">
  <img src="pics/<%=rs.getString("img")%>" alt="Ayushi" style="width:100%">
  <div class="container">
    <p style="font-size: 35px;"><b><%=rs.getString("img")%></b></p> 
    <p><%=rs.getString("username")%></p> 
  </div>
</div>

</input>
<%} %>
</body>
<script>
function myFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";

        }
    }
}
</script>
</html> 
