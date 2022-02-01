$(document).ready(function (){
    $("#search").click(function()
	{
    	alert("DATA");
    	var val=$.trim(this.value);
    	$.post("search.jsp",{
    		friend:val
    	},
    	function(data,status){
    		
    	alert(" INCOMING");	
    	});
    	
    		
    	
	});
	
});

