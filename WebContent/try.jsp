<!DOCTYPE HTML>
<HTML>
<HEAD>
	<link rel="stylesheet" type="text/css" href="style.css">
	<title>social tracker</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$("#login").click(function(){
		$("div>ul>li+li").toggleClass("dropdown open");
	});
	
});

function check(){
	if (null==session.getAttribute(key))
	{
		window.location.href="try.html"
	}
	else{
	 	window.location.href="home.jsp"
	}
	}
</script>
 <style> 	body{
 
background-image:url(pics/cc.jpg);
background-size:cover;
background-color: #DDDDDD;
}
.button {

background-image: -moz-linear-gradient(top, #FFFF00, #FFFFFF);
background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0.00, #FFFF00), color-stop(1.0, #FFFFFF));
background-color: #DDDDDD; 
color:black;
text-align: center;
display: inline-block;
font-size: 18px;
height: 200px;
width: 200px;
line-height: 1.428571429;
border-radius: 100%;
font-family: Barrio;
shadow: 10px 10px 5px #888888;
}
</style>

</HEAD>
<header onload="check()">
	<div class="jumbotron" style="background-image: -moz-linear-gradient(left, #D3D3D3, #FFFFFF);
background-image: -webkit-gradient(linear, left top, right top, color-stop(0.00, #D3D3D3), color-stop(1.0, #FFFFFF));
background-color: #DDDDDD;">
		<p style="font-color:black; text-align:center;"><img src="pics/cooltext236040979457189.png" style="height:40px"/></p>
		 <ul class="nav navbar-nav navbar-right">
                  <li><a href="reg.html">Register   <span class="glyphicon glyphicon-edit"></span></a></li>
                  <li class="dropdown">
                     <a href="#s" class="dropdown-toggle" data-toggle="dropdown">Login     <span class="glyphicon glyphicon-user"></span> <b class="caret"></b></a>
                     <ul class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                        <li>
                           <div class="row">
                              <div class="col-md-12">
                                 <form class="form" role="form" method="post" action="login.jsp" accept-charset="UTF-8" id="login-nav">
                                    <div class="form-group">
                                       <label class="sr-only" for="username">User Name</label>
                                       <input type="username" class="form-control" name="username" placeholder="username" autofocus required>
                                    </div>
                                    <div class="form-group">
                                       <label class="sr-only" for="Password">Password</label>
                                       <input type="password" class="form-control" name="password" placeholder="password" required>
                                    </div>
                                    <div class="form-group">
                                       <button type="submit" class="btn btn-success btn-block">Login</button>
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </li>
               </ul>
	</div>
</header>
<BODY >

<div class="container-fluid">
	
	<div class="row">
<a id="login">
    	<div class="col-sm-4 col-md-6">
      		<div class="flip-container" ontouchstart="this.classList.toggle('hover');" >
	<div class="flipper">
		<div class="front">
			<button class="button" data-toggle="modal" data-target="#myModal1" style="font-size:27px">Chat</button>
		</div>
		<div class="back">
			<button class="button" data-toggle="modal" data-target="#myModal1" >Interact with your friends by exchanging messages</button>
		</div>
	</div>
</div>
    	</div>

    	<div class="col-sm-4 col-md-6" ">
      		<div class="flip-container" ontouchstart="this.classList.toggle('hover');" >
	<div class="flipper">
		<div class="front">
			<button class="button" data-toggle="modal" data-target="#myModal1"  style="font-size:27px">Track a friend</button>
		</div>
		<div class="back">
			<button class="button" data-toggle="modal" data-target="#myModal1" >Search your friends faster.Just request for permission</button>
		</div>
	</div>
</div>
    	</div>
  </div>
</div>
<div class="container-fluid">
	<div class="row">
    	<div class="col-sm-4 col-md-6">
      		<div class="flip-container" ontouchstart="this.classList.toggle('hover');" >
	<div class="flipper">
		<div class="front">
			<button class="button" data-toggle="modal" data-target="#myModal1" style="font-size:27px">Forum</button>
		</div>
		<div class="back">
			<button class="button" data-toggle="modal" data-target="#myModal1" >Where all your problems can find a solution</button>
		</div>
	</div>
</div>
    	</div>

    	<div class="col-sm-4 col-md-6" ">
      		<div class="flip-container" ontouchstart="this.classList.toggle('hover');" >
	<div class="flipper">
		<div class="front">
			<button class="button" data-toggle="modal" data-target="#myModal1" style="font-size:27px" >Add a friend</button>
		</div>
		<div class="back">
			<button class="button" data-toggle="modal" data-target="#myModal1" >Make your experience interesting by adding your friends.</button>
		</div>
	</div>
</div>
    	</div>
  </div>
</div>
</a>
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
          <p>You are NOT Logged in !!!</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger"" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<footer>
	<p style="background-color: grey;font-color:black; text-align:center">Stay social stay connected</p>
</footer>
</BODY>
