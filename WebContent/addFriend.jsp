<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>

<!DOCTYPE html >
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="script/jquery-1.11.3.js"></script>
<script type="text/javascript" src="headfoot.js"></script>
  
	<link rel="stylesheet" href="af.css">
  
<title>Add a Friend</title>
<script type="text/javascript" src="script/jquery-1.11.3.js"></script>
<style>

</style>
</head>
<body>


<ul  style="margin-left:20%;padding:40px;">
     <li><form action="search.jsp" method="post">
            <input type="text" name="friend" id="friend"style="width:600px; margin-top: 20px;position:relative" placeholder="Search" autofocus required> 
            <input type="submit" value="submit">
        </form>
     	
     </li>
</ul>


</body>
</html>
