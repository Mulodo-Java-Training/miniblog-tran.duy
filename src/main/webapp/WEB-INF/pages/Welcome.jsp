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
<body data-ng-app="blogApp" ng-controller="welcomeCtrl">

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
					<a href="" ng-click="welcome()" style="font-size: 45px; padding: 10px;">Mini Blog</a>
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
	<h2>
		<a href="" ng-click="welcome()">Home</a> 
		<a href="" ng-show="showPostDetail">/ {{detailPost.title}}</a> 
		<a href="" ng-show="showPostsOfAuthor">/ {{AuthorName}}</a> 
	</h2>
	{{error}}
	<a href="" ng-click="home()">Home angular</a>
	<a href="home.html">Home</a> |
	<a href="myProfile.html">My Profile</a> |
	<a href="myPosts.html">My Posts</a> |
	<a href="test2.html">test 2</a> |
	<a href="validateForm.html">Test Form</a> |
	<a href="atest.html">test test</a> |
	<a href="customer.html">666666</a> |
	<a href="getPosts.html">Get All Posts</a> | 
	<a href="ajax.html">Test Ajax</a> |
	<a href="" ng-click="postDetail()">Post Detail</a> |
	<a href="login.html">Check Login</a>
	<hr>
	<div class="container">
		<div class="jumbotron">
			<div class="row">
			
				<!-- All Posts: Start -->
				<div id="listAllPost" ng-show="showAllPosts">
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
													<a href="" ng-click="postDetail(lst.id)">{{lst.title}}</a>
												</h2>
											<div>
												<h4 style="float: left; padding: 5px;">Author: <a href="" ng-click="getPostsByAuthor(lst.user_id)">{{lst.firstName + ' ' + lst.lastName}}</a></h4>
												<h4 style="float: right; padding: 5px;">Updated: {{lst.updated_at}}</h4>
											</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-9">
											  	{{lst.description}}
										 	 <a href="" ng-click="postDetail(lst.id)">Read More...</a>
									  	</div>
										</div>	
								</td>
							</tr>				
					</table>
				</div>
				</div>
				<!-- All Posts: End -->
				
				<!-- Detail Post: Start -->
				<div id="postDetail" ng-show="showPostDetail">
				  	<div class="col-md-9">
          <table class="table">   
              
              <tr >
                <td>
                  <div class="row">
                      <div class="col-md-2">
                        <img style="width: 100px; height: 100px" src="images/{{detailPost.avatar}}" alt="Avatar">
                      </div>
                      <div class="col-md-10">                   
                        <h2>
                          <a href="#"> {{detailPost.title}} </a>
                        </h2>
                      <div>
                        <h4 style="float: left; padding: 5px;">Author: <a href="" ng-click="getPostsByAuthor(detailPost.user_id)">{{detailPost.firstName}} {{detailPost.lastName}}</a></h4>
                        <h4 style="float: right; padding: 5px;">Updated: {{detailPost.updated_at}}</h4>
                      </div>
                      </div>
                    </div>
                    <div class="row" style="font-size:20px;">
                      <div class="col-md-12">
                          {{detailPost.description}}
                      </div>
                    </div>  
                </td>
              </tr>       
          </table>
    <h2>Comments</h2>
      <div>
      <form action="" method="POST" role="form">     
        <div class="form-group">
          <textarea name="cmContent" placeholder="Add comment here" style="font-size:20px; width:100%"></textarea>
        </div>      
        <button type="submit" class="btn btn-primary">Add Comment</button>
      </form>
      </div>
      <hr/>
      <h4>{{nocomment}}</h4>
      <div ng-repeat="comment in comments" class="media">
        <a class="pull-left" href="#">
          <img style="width: 100px; height: 100px" class="media-object" src="images/{{comment.avatar}}" alt="Avatar">
        </a>
        <div class="media-body">
          <h3 class="media-heading"><a href="" ng-click="getPostsByAuthor(comment.user_id)">{{comment.firstName}} {{comment.lastName}}</a><span style="float:right">Date: {{comment.updated_at}}</span></h3>
          <p>{{comment.description}}</p>
        </div>
      </div>
      </div>
      </div>
	<!-- Detail Post: End -->
	
	
	<!-- Posts of Author: Start -->
	<div id="postsOfAuthor" ng-show="showPostsOfAuthor">
				<div class="col-md-9" data-ng-controller="allPostsCtrl">
					<h4>{{nopost}}</h4>
					<table class="table">						
							<tr data-ng-repeat="lst in postsOfAuthor">
								<td>
									<div class="row">
											<div class="col-md-2">
												<img style="width: 100px; height: 100px" src="images/{{lst.avatar}}" alt="Avatar">
											</div>
											<div class="col-md-10">										
												<h2>
													<a href="" ng-click="postDetail(lst.id)">{{lst.title}}</a>
												</h2>
											<div>
												<h4 style="float: left; padding: 5px;">Author: <a href="#">{{lst.firstName + ' ' + lst.lastName}}</a></h4>
												<h4 style="float: right; padding: 5px;">Updated: {{lst.updated_at}}</h4>
											</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-9">
											  	{{lst.description}}
										 	 <a href="" ng-click="postDetail(lst.id)">Read More...</a>
									  	</div>
										</div>	
								</td>
							</tr>				
					</table>
				</div>
				</div>
	<!-- Posts of Author: End -->
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
										<a href="" ng-click="postDetail(lst.id)">{{lst.title}}</a>
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
										<a href="" ng-click="postDetail(lst.id)">{{lst.title}}</a>
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