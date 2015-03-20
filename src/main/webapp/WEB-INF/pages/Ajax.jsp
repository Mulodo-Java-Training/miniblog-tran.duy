<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
<script type="text/javascript" src="js/app.js"></script>
<title>Insert title here</title>
</head>
<body onload="load2()">

<h1>Angular: Search user by firstname, lastname</h1>

<h1>Search by name</h1>
<div ng-app="ajaxApp" ng-controller="ajax1Ctrl">
<input type="text" placeholder="Search name" ng-model="searchN"/>
<ul ng-repeat="lstName in listName | filter:searchN">
	
	{{lstName}}
</ul>
</div>

<h1>Angular Filter</h1>
<h1>Test Angular</h1>

<div ng-app="ajaxApp" ng-controller="ajaxCtrl">

<input type="text" placeholder="Search posts" ng-model="test"/>
<ul ng-repeat="lst in list | filter:test">
<li >
	{{lst.id + ', ' + lst.title + ', ' + lst.description + ', ' + lst.updated_at + ', ' + lst.deactived}}
</li>
<li>
	 <a href="apis/v1/posts/users/{{lst.user_id}}"> {{lst.firstName + ' ' + lst.lastName}} </a>
</li>
</ul>
<hr>
</div>


<hr>

<h1>Load All Posts</h1>

<script>
function loadAllPosts(){
	$.ajax({
		url:'apis/v1/posts',    
		method:'get',
		success: function(response){    
			alert(response[3].title);   				   				
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
			+'<td>'+data[i].user+'</td>'
			
			+'</tr>';    				    					
		}
		document.getElementById("jSon").innerHTML = txt;
	});
}
</script>

<button onclick="loadAllPosts()">Test Ajax</button>

<table id="jSon">

</table>
<a href="apis/v1/posts">dfasdfa</a>



</body>
</html>