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
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-animate.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-route.js"></script>
    
	<script type="text/javascript" src="js/angularApp.js"></script>
	<script type="text/javascript" src="js/ui-bootstrap-tpls-0.12.1.min.js"></script>
	<style type="text/css">
	.auto-hide{
	-webkit-transition:all linear 3s;
 	 transition:all linear 3s;
	}
	.auto-hide.ng-hide {
  	opacity:0;
	}
	</style>
	
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
					<a href="welcome.html" style="font-size: 45px; padding: 10px;">Mini Blog</a>
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
      <form ng-submit="submit(user)" ng-controller="registerCtrl" name="registerForm" novalidate >
        <legend>Register</legend>
        <!-- USERNAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.username.$invalid && registerForm.username.$dirty, 'has-success': registerForm.username.$valid}">
          <input ng-model="user.username" type="text" class="form-control" name="username" placeholder="Username" required ng-minlength="6" ng-maxlength="32" ng-model="username">
            <p ng-show="registerForm.username.$error.required && registerForm.username.$dirty" class="help-block">Username is required.</p>
            <p ng-show="registerForm.username.$error.minlength" class="help-block">Username must be more than 6 characters long.</p>
            <p ng-show="registerForm.username.$error.maxlength" class="help-block">Username must be less than 32 characters long.</p>
            <i ng-show="registerForm.username.$invalid && registerForm.username.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
            <i ng-show="registerForm.username.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- PASSWORD -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.password.$invalid && registerForm.password.$dirty, 'has-success': registerForm.password.$valid}">
          <input ng-model="user.password"type="password" class="form-control" name="password" placeholder="Password" required >
            <p ng-show="registerForm.password.$error.required && !registerForm.password.$pristine" class="help-block">Password is required.</p>
            <i ng-show="registerForm.password.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- FIRST NAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.firstname.$invalid && registerForm.firstname.$dirty, 'has-success': registerForm.firstname.$valid}">
          <input ng-model="user.firstname" type="text" class="form-control" name="firstname" placeholder="First name" required ng-minlength="2" ng-maxlength="15">
            <p ng-show="registerForm.firstname.$error.required && !registerForm.firstname.$pristine" class="help-block">Firstname is required.</p>
            <p ng-show="registerForm.firstname.$error.minlength" class="help-block">Firstname must be at least 2 characters long.</p>
            <p ng-show="registerForm.firstname.$error.maxlength" class="help-block">Firstname must be less than 15 characters long.</p>
            <i ng-show="registerForm.firstname.$invalid && registerForm.firstname.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
            <i ng-show="registerForm.firstname.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- LAST NAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.lastname.$invalid && registerForm.lastname.$dirty, 'has-success': registerForm.lastname.$valid}">
          <input ng-model="user.lastname" type="text" class="form-control" name="lastname" placeholder="Last name" required ng-minlength="2" ng-maxlength="15">
            <p ng-show="registerForm.lastname.$error.required && !registerForm.lastname.$pristine" class="help-block">Lastname is required.</p>
            <p ng-show="registerForm.lastname.$error.minlength" class="help-block">Lastname must be at least 2 characters long.</p>
            <p ng-show="registerForm.lastname.$error.maxlength" class="help-block">Lastname must be less than 15 characters long.</p>
            <i ng-show="registerForm.lastname.$invalid && registerForm.lastname.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
            <i ng-show="registerForm.lastname.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- GENDER -->
        <div class="form-group has-feedback">
        <label class="radio-inline">
          <input ng-model="user.gender" type="radio" name="gender" value="0">Female
        </label>
        <label class="radio-inline">
          <input ng-model="user.gender" type="radio" name="gender" value="1">Male
        </label>
        </div>
        <!-- BIRTH DATE -->
        <div class="form-group has-feedback" ng-class="{'has-success': registerForm.birthdate.$dirty && registerForm.birthdate.$valid, 'has-error': registerForm.birthdate.$invalid && registerForm.birthdate.$dirty}">
          <input ng-model="user.birthdate" type="text" class="form-control" name="birthdate" placeholder="Birth Date" required min="1950-01-01" max="2005-12-31" ng-pattern="/^(19|20)[0-9]{2}-((0[1-9])|(1[012]))-((0[1-9])|([1-2][0-9])|(3[0-1]))$/">
          <p ng-show="registerForm.birthdate.$error.required && !registerForm.birthdate.$pristine" class="help-block">Birth Date is required.</p>
          <p ng-show="registerForm.birthdate.$invalid && registerForm.birthdate.$dirty" class="help-block">Must follow format: yyyy-MM-dd; 
          Min Date: 1950-01-01; 
          Max Date: 2005-12-31.</p>
          <i ng-show="registerForm.birthdate.$invalid && registerForm.birthdate.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="registerForm.birthdate.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
   		<p>
   		</p>
        </div>
        <!-- EMAIL -->
        <div class="form-group has-feedback" ng-class="{'has-error': registerForm.email.$invalid && registerForm.email.$dirty, 'has-success': registerForm.email.$valid && registerForm.email.$dirty}">
          <input ng-model="user.email" type="email" class="form-control" name="email" placeholder="Email" required>
          <p ng-show="registerForm.email.$error.required && !registerForm.email.$pristine" class="help-block">Email is required.</p>
          <p ng-show="registerForm.email.$invalid && !registerForm.email.$pristine" class="help-block">Please enter a valid email.</p>
          <i ng-show="registerForm.email.$invalid && registerForm.email.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="registerForm.email.$valid && registerForm.email.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>  
        </div>             
        <button type="submit" class="btn btn-primary btn-block" name="registerBtn" ng-disabled="registerForm.$invalid" ng-class="{'btn-success': registerForm.$valid}">Register</button>
        	<h4 ng-show="show" class="auto-hide" style="color:green">{{successMessage}}</h4>    
        	<h4 style="color:red">{{err0}}</h4>  
	        <h4 style="color:red">{{err1}}</h4>
	        <h4 style="color:red">{{err2}}</h4>
	        <h4 style="color:red">{{err3}}</h4>
	        <h4 style="color:red">{{err4}}</h4>
	        <h4 style="color:red">{{err5}}</h4>
	        <h4 style="color:red">{{err6}}</h4>
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
					<tbody>
							<tr data-ng-repeat="lst in listPosts | filter : searchPost as results">
								<td>																
									<h4>
										<a href="apis/v1/post/{{lst.id}}">{{lst.title}}</a>
									</h4>
									<p>{{lst.description}}</p>
								</td>
							</tr>
							<tr ng-if="results.length == 0"><td><h4>No results found...</h4></td></tr>	
					</tbody>
					</table>
					<table class="table" ng-show="!searchPost.title.length">
					<tbody>			
							<tr data-ng-repeat="lst in listPosts | limitTo : 5">
								<td>									
									<h4>
										<a href="apis/v1/post/{{lst.id}}">{{lst.title}}</a>
									</h4>
									<p>{{lst.description}}</p>
								</td>
							</tr>	
						</tbody>
					</table>
				</div>
		
  </div>
</div>
</div>

<br/>
<footer style="background-color: black; color: white; padding: 2em; margin-top: 2px;">Keep Moving Forward</footer>

</body>
</html>