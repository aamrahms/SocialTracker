<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<!DOCTYPE html >
<html>
<head>
	<title>Search</title>
<script type="text/javascript" src="script/jquery-1.11.3.js"></script>
 <script type="text/javascript" src="headfoot.js"></script>
 <link rel="stylesheet" href="style.css">	
<style>
	td:first-letter{
		color:red;
		text-transform: uppercase;
	}
	  
tt{
	margin-top:20px;
}
img{
	height:300px;
	width:300px;
	padding:10px;
	border: white;
}
</style>
</head>
</head>
<body >
<header > 
<%
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

<section>
 
 <table  >
	
			
		
	<tbody>
	<b><tr style="margin-left:10px;font-size:80px">Search results for  </tr></b>
					
<%
String category=request.getParameter("category") ;
String name=request.getParameter("name") ;
String sno ;


	try
	{
		Class.forName("com.mysql.jdbc.Driver") ;
		
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/food", "root", "root");
    	Statement statement = connection.createStatement() ;
    
   
    	if(StringUtils.isBlank(name))
    	{
    		
    		out.println(category);    	
    		ResultSet resultset = statement.executeQuery(" select * from search where category='"+category+"' order by name asc") ;
           	
   			while(resultset.next())
   			{
   				
   			%>
   			
   			<tr> 
   			
   			<td>

   			<img src="pics/<%=resultset.getString("category") %>/<%=resultset.getString("pic") %>"  >
   			
			</td>
   			
   			<td style="font-size:35px"><%=resultset.getString("name") %>
   			</td>
   			 
   			<td>
			<%
			sno= resultset.getString("sno"); %>
			
			
			<button><a href ="item.jsp?sno=<%=sno %>" id="sno">Select</a></button>
			
			</td>
   			
   			
   		</tr>
   		
   		
   		<%	
   			}
   		}
    	
    	else if(StringUtils.isBlank(category))
    	{
    		out.println(name);    	
    		ResultSet resultset = statement.executeQuery(" select * from search where name like '%"+name+"%' order by name asc") ;
    		

			while(resultset.next())
			{
			
			%>
			
			<td>
			<img src="pics/<%=resultset.getString("category") %>/<%=resultset.getString("pic") %>"  style="height=50px ; width=50px">
			</td>
			
			<td ><%=resultset.getString("name") %>
			</td>
			 
			<td>
			<%
			sno= resultset.getString("sno"); %>
			
			
			<button><a href ="item.jsp?sno=<%=sno %>" id="sno">Select</a></button>
			
			</td>
			
			
		</tr>
		
		
		<%	
			}
		}
    	 
      		 
		%>
		</tbody>
		</table>
		<br>
		<br>
		<%
		out.println("No more results found!");
		
					
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
		
    	
	
  
</section>




<footer>
<div id="footer">
</div></footer>

</body>
</html>
