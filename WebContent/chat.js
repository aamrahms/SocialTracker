$(document).ready(function(){
	$("textarea").keypress(function(e){	
		var text=$("textarea").value();
		$("textarea").hide();
		if(e.which==13)
			{
				$("textarea").hide();
				$('<div class="her">'+text+'<div class="date"><%out.println(d.getHours()+":"+d.getMinutes());%></div>').appendTo("p");
			}
		else
			{
			$("textarea").hide();
			}
	});
	
	
});