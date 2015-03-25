<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Welcome Page</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-animate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-route.js"></script>
<script type="text/javascript" src="js/angularApp.js"></script>


</head>
<body data-ng-app="blogApp" ng-controller="postDetailCtrl">

	<!-- navbar -->
	<nav class="navbar navbar-inverse ">
		<!-- "navbar-fixed-top" -->
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1>
					<a href="#" style="font-size: 45px; padding: 10px;">Mini Blog</a>
				</h1>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<form class="navbar-form navbar-right" action="apis/v1/login"
					method="post" enctype="application/x-www-form-urlencoded">
					<table>
						<tr>

							<td style="padding: 5px">
								<div class="form-group has-feedback">

									<input type="text" placeholder="User name" class="form-control"
										name="username"> <i
										class="glyphicon glyphicon-user form-control-feedback "></i>
								</div>
							</td>
							<td style="padding: 5px">
								<div class="form-group has-feedback">
									<input type="password" placeholder="Password"
										class="form-control" name="password"> <i
										class="glyphicon glyphicon-lock form-control-feedback"></i>
								</div>
							</td>
							<td style="padding: 5px;">
								<!-- <h3><a href="Home.html">Sign In</a></h3>  -->
								<button type="submit" class="btn btn-success">Sign in</button>
							</td>
						</tr>
						<tr>
							<td></td>
							<td style="padding: 5px; text-align: center">
								<div>
									<label> <a href="#">Forget your password!</a>
									</label>
								</div>
							</td>
							<td style="padding: 5px; text-align: center"><label>
									<a href="register.html">Register</a>
							</label></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</nav>
	<h1>Post Detail {{postId1}} {{test}}</h1>
	<hr/>
	<div class="container">
		<div class="jumbotron">

			<div class="row">
				<!-- All Posts -->
				<div class="col-md-9" data-ng-controller="allPostsCtrl">
					<table class="table">						
							<tr data-ng-repeat="lst in listPosts">
								<td>
									<div class="row">
											<div class="col-md-2">
												<img style="width: 100px; height: 100px" src="images/{{lst.avatar}}" alt="Avatar">
											</div>
											<div class="col-md-10">										
												<h2>
													<a href="apis/v1/post/{{lst.id}}">{{lst.title}}</a>
												</h2>
											<div>
												<h4 style="float: left; padding: 5px;">Author: {{lst.firstName + ' ' + lst.lastName}} </h4>
												<h4 style="float: right; padding: 5px;">Updated: {{lst.updated_at}}</h4>
											</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-9">
											  	{{lst.description}}
										 	 <a href="apis/v1/post/{{lst.id}}">Read More...</a>
									  	</div>
										</div>	
								</td>
							</tr>				
					</table>
				</div>
				<br />
				
				<!-- Search Posts: Start -->
				<div class="col-md-3" data-ng-controller="allPostsCtrl">
					<div class="form-group has-feedback">
						<input ng-model="searchPost.title" type="text" placeholder="Search posts by title..."
							class="form-control" name="searchInput"> <i
							class="glyphicon glyphicon-search form-control-feedback "></i>
					</div>					
					<table class="table" ng-show="searchPost.title.length">		
							<tr data-ng-repeat="lst in listPosts | filter : searchPost as results">
								<td>									
									<h4>
										<a href="apis/v1/post/{{lst.id}}">{{lst.title}}</a>
									</h4>
									<p>{{lst.description}}</p>
								</td>
							</tr>	
							<tr ng-if="results.length == 0"><td><h3>No results found...</h3></td></tr>	
					</table>
					<table class="table" ng-show="!searchPost.title.length">			
							<tr data-ng-repeat="lst in listPosts | limitTo : 5">
								<td>									
									<h4>
										<a href="apis/v1/post/{{lst.id}}">{{lst.title}}</a>
									</h4>
									<p>{{lst.description}}</p>
								</td>
							</tr>	
					</table>
				</div>
				<!-- Search Posts: End -->
			</div>
		</div>
	</div>

	<br />
	<footer
		style="background-color: black; color: white; padding: 2em; margin-top: 2px;">Keep
		Moving Forward</footer>
</body>
</html>