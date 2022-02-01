


<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>

<!DOCTYPE html >
<html>
<head>
<script type="text/javascript" src="headfoot.js"></script>

<script type="text/javascript" src="script/jquery-1.11.3.js"></script>

<style>

body{
	background:url(pics/_original.jpg) repeat;
}
.main{
	border: 2px solid black;
	border-radius: 8px;
}
td{
	
	padding:20px;
	margin-right:50px;
	
}
table{
	
	margin:auto;
	margin-bottom:30px;
	border-radius:30px;
	background-color:black;
	color:white;
	display:block;
	width:85%;
}
table table{
	margin:5px 5px 5px 5px;
}
.main{
	border:none;
	font-size:20px;
}
.main{
	box-shadow: red;
	}
	li{
		list-style-type:none;
	}
#add{
	float:right;
	width:100px;
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
 <table  >
	
<tbody>				

<%

String friend = request.getParameter("friend");
String sno ;
			

	try
	{
		
		Class.forName("com.mysql.jdbc.Driver") ;
	    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/tracker", "root", "root");
	    PreparedStatement statement = null;
    ResultSet resultset = null;
    
    	//ResultSet resultset = statement.executeQuery("select * from recs where username like '%"+friend+"%' or first like '%"+friend+"%' or last '%"+friend+"%' order by first asc" ) ; 
       statement = connection.prepareStatement("SELECT * FROM recs WHERE (username LIKE ?) OR (first LIKE ?) OR (last LIKE ? ) ");
        //ResultSet resultset= statement.executeQuery("select first from recs where username='abcdef'");
    	  statement.setString(1, "%" + friend + "%");
          statement.setString(2, "%" + friend + "%");
          statement.setString(3, "%" + friend + "%");
        resultset = statement.executeQuery();
    		
    	while(resultset.next())
   			{
   				String user =resultset.getString("username");
   			%>
   		
   			<tr > 
   			 <table>
   			 	<tr >
   			 		<td rowspan=2 style="width:40px;height:40px"><img alt="No picture"src="pics/<%=resultset.getString("img")%>"/> </td>
   			 		<td><%=resultset.getString("first") %>  <%=resultset.getString("last") %></td>
   					<%
   					int i=0;
   						while(i<9)
   						{
   						
   					%>
   					
   					<td ></td>
   					<% i++;
   						}
   						%>
   					<td rowspan=2><br>
   					<form action="addFrien.jsp" method="post" id="add">
   					<input type="hidden" value="<%=user%>" name="friend">
   					<input style="margin-right:20px;width:150px;height:40px;background-color:rgb(69,69,69)"type="submit" value="ADD"  >
   					</form> </td>
   				 </tr>
   				 <tr>
   				 	<td> Username :
   				 	 
   					<%=user%> 
   					</td>
   				</tr>
   			 </table>  			
   			
   		
   		</tr>
   			
   		
   		<%	
   			} 
      		 
		%>
		</tbody>
		</table>
		</div>
		<br>
		<br>
		<%					
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
		
    	
	
  

</body>
</html>
