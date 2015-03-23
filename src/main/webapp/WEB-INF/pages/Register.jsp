<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Register Page</title>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
	<script type="text/javascript" src="js/angularApp.js"></script>
</head>
<body ng-app="blogApp" ng-controller="registerCtrl">

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
<h1>Register</h1>
<hr>
<div class="container">
<div class="jumbotron">
   
  <div class="row">
    <div class="col-md-9">
      <form action="123" method="POST" role="form" id="registerForm" name="registerForm" novalidate>
        <legend>Register</legend>
        <!-- USERNAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.username.$invalid && registerForm.username.$dirty, 'has-success': registerForm.username.$valid}">
          <input type="text" class="form-control" name="username" placeholder="Username" required ng-minlength="6" ng-maxlength="32" ng-model="username">
            <p ng-show="registerForm.username.$error.required && registerForm.username.$dirty" class="help-block">Username is required.</p>
            <p ng-show="registerForm.username.$error.minlength" class="help-block">Username must be more than 6 characters long.</p>
            <p ng-show="registerForm.username.$error.maxlength" class="help-block">Username must be less than 32 characters long.</p>
            <i ng-show="registerForm.username.$invalid && registerForm.username.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
            <i ng-show="registerForm.username.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- PASSWORD -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.password.$invalid && registerForm.password.$dirty, 'has-success': registerForm.password.$valid}">
          <input type="password" class="form-control" name="password" placeholder="Password" required ng-model="password">
            <p ng-show="registerForm.password.$error.required && !registerForm.password.$pristine" class="help-block">Password is required.</p>
            <i ng-show="registerForm.password.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- FIRST NAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.firstname.$invalid && registerForm.firstname.$dirty, 'has-success': registerForm.firstname.$valid}">
          <input type="text" class="form-control" name="firstname" placeholder="First name" required ng-minlength="6" ng-maxlength="15" ng-model="firstname">
            <p ng-show="registerForm.firstname.$error.required && !registerForm.firstname.$pristine" class="help-block">Firstname is required.</p>
            <p ng-show="registerForm.firstname.$error.minlength" class="help-block">Firstname must be more than 6 characters long.</p>
            <p ng-show="registerForm.firstname.$error.maxlength" class="help-block">Firstname must be less than 15 characters long.</p>
            <i ng-show="registerForm.firstname.$invalid && registerForm.firstname.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
            <i ng-show="registerForm.firstname.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- LAST NAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.lastname.$invalid && registerForm.lastname.$dirty, 'has-success': registerForm.lastname.$valid}">
          <input type="text" class="form-control" name="lastname" placeholder="Last name" required ng-minlength="6" ng-maxlength="15" ng-model="lastname">
            <p ng-show="registerForm.lastname.$error.required && !registerForm.lastname.$pristine" class="help-block">Lastname is required.</p>
            <p ng-show="registerForm.lastname.$error.minlength" class="help-block">Lastname must be more than 6 characters long.</p>
            <p ng-show="registerForm.lastname.$error.maxlength" class="help-block">Lastname must be less than 15 characters long.</p>
            <i ng-show="registerForm.lastname.$invalid && registerForm.lastname.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
            <i ng-show="registerForm.lastname.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- GENDER -->
        <div class="form-group has-feedback">
        <label class="radio-inline">
          <input type="radio" name="gender" value="0" checked>Female
        </label>
        <label class="radio-inline">
          <input type="radio" name="gender" value="1">Male
        </label>
        </div>
        <!-- BIRTH DATE -->
        <div class="form-group has-feedback" ng-class="{'has-success': registerForm.birthdate.$dirty, 'has-error': registerForm.birthdate.$invalid && registerForm.birthdate.$dirty}">
          <input type="date" class="form-control" name="birthdate" placeholder="Birth Date" ng-model="birthdate" required min="1950-01-01" max="2015-01-01">
          <p ng-show="registerForm.birthdate.$error.required && !registerForm.birthdate.$pristine" class="help-block">Birth Date is required.</p>
          <i ng-show="registerForm.birthdate.$invalid && registerForm.birthdate.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="registerForm.birthdate.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- EMAIL -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.email.$invalid && registerForm.email.$dirty, 'has-success': registerForm.email.$valid && registerForm.email.$dirty}">
          <input type="email" class="form-control" name="email" placeholder="Email" ng-model="email" required>
          <p ng-show="registerForm.email.$error.required && !registerForm.email.$pristine" class="help-block">Email is required.</p>
          <p ng-show="registerForm.email.$invalid && !registerForm.email.$pristine" class="help-block">Please enter a valid email.</p>
          <i ng-show="registerForm.email.$invalid && registerForm.email.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="registerForm.email.$valid && registerForm.email.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>  
        </div>      
        <button type="submit" class="btn btn-primary btn-block" name="registerBtn" ng-disabled="registerForm.$invalid" ng-class="{'btn-success': registerForm.$valid}">Register</button>
      </form>
      <hr>
    </div>
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
  </div>
</div>
</div>

<br/>
<footer style="background-color: black; color: white; padding: 2em; margin-top: 2px;">Keep Moving Forward</footer>

</body>
</html>