
$(document).ready(function (){
	/*$("h5").hide();
	 $("td").hide();
	$("p").hide();
    */$("#search").keydown(function()
	{
    	var val=$.trim(this.value);
    	if (val === "")
    	{
    		$("table").show();
    			
    	}	
    	else
    	{
    		$("table").show();
    			
    	}    		
	});
	
});

