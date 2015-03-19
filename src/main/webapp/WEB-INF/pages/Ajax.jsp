<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="load2()">

<h1>Load All Posts</h1>

<script>
function loadAllPosts(){
	$.ajax({
		url:'apis/v1/posts',    
		method:'get',
		success: function(response){    	
			alert(response);   				   				
		},
		error: function(response,status,err){	    				
			alert("error: " +response+" status: " + status + " er: "+err);    				
		}
	});
}
</script>
<script>
function load2(){
	$.ajax({
		url:'apis/v1/posts',
		method:'get'
	})
	.done(function(data){
		var txt ="";
		for (var i=0; i<data.length; i++) {
			txt += '<tr><td>'+data[i].id+'</td>'
			+'<td>'+data[i].title+'</td>'
			+'<td>'+data[i].description+'</td>'	
			+'<td>'+data[i].updated_at+'</td>'
			+'</tr>';    				    					
		}
		document.getElementById("jSon").innerHTML = txt;
	});
}
</script>

<table id="jSon">

</table>
<a href="apis/v1/posts">dfasdfa</a>
</body>
</html>