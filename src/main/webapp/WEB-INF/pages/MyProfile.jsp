<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Profile</title>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script src="js/ngApp.js"></script>

</head>
<body ng-app="validationApp">


<!-- navbar -->
<nav class="navbar navbar-inverse "> <!-- "navbar-fixed-top" -->
  <div class="container">
  <div class="row">     
     <div class="col-md-3">
     <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
          data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <h1><a href="#" style="font-size:35px;padding:25px;margin-bottom:0px">Mini Blog</a></h1>
    </div>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
    <div class="col-md-6">          
           <div class="nav navbar-nav navbar-left form-group has-feedback" style="margin-top:20px; width:100%; margin-left:10px; margin-bottom:0px">            
            <input type="text" placeholder="Search user..." class="form-control"> 
            <i class="glyphicon glyphicon-search form-control-feedback "></i>            
        </div>       
    </div>
       <div class="col-md-3">
         <ul class="nav navbar-nav navbar-right">           
       <li class="dropdown">
       <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="padding:25px;">Hi, Duy Tran <span class="caret"></span></a>
       <ul class="dropdown-menu" role="menu">
         <li><a href="#">My Profile</a></li>
         <li><a href="#">My Posts</a></li>
         <li class="divider"></li>
         <li><a href="#">Log Out</a></li>         
       </ul>
       </li>
     </ul>
        </div>
        </div>
    </div>
  </div>
</nav>

<h1>My Profile</h1>
<hr>
<div class="container">
<div class="jumbotron">
   
  <div class="row">
    <div class="col-md-5">
    <br>
      <form action="" method="POST" role="form" name="formUpdate" novalidate ng-controller="myProfileCtrl">
        <legend>Update Information</legend>
        <!-- FIRST NAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': formUpdate.firstname.$invalid, 'has-success': formUpdate.firstname.$valid && formUpdate.firstname.$dirty}">
          <input type="text" class="form-control" name="firstname" placeholder="First name" ng-model="firstname" ng-minlength="6" ng-maxlength="15">
          <p ng-show="formUpdate.firstname.$error.minlength" class="help-block">First name must be more than 6 characters long.</p>
          <p ng-show="formUpdate.firstname.$error.maxlength" class="help-block">First name must be more than 15 characters long.</p>
          <i ng-show="formUpdate.firstname.$invalid" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="formUpdate.firstname.$valid && formUpdate.firstname.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- LAST NAME -->
        <div class="form-group has-feedback" ng-class="{'has-error': formUpdate.lastname.$invalid, 'has-success': formUpdate.lastname.$valid && formUpdate.lastname.$dirty}">
          <input type="text" class="form-control" name="lastname" placeholder="Last name" ng-model="lastname" ng-minlength="6" ng-maxlength="15">
          <p ng-show="formUpdate.lastname.$error.minlength" class="help-block">Last name must be more than 6 characters long.</p>
          <p ng-show="formUpdate.lastname.$error.maxlength" class="help-block">Last name must be more than 15 characters long.</p>
          <i ng-show="formUpdate.lastname.$invalid" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="formUpdate.lastname.$valid && formUpdate.lastname.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>        
        <!-- AVATAR -->
        <div class="form-group has-feedback" ng-class="{'has-success': formUpdate.avatar.$dirty}">
          <input type="text" class="form-control" name="avatar" placeholder="Avatar" ng-model="avatar">
          <i ng-show="formUpdate.avatar.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- EMAIL -->
         <div class="form-group has-feedback" ng-class="{'has-error': formUpdate.email.$invalid && formUpdate.email.$dirty, 'has-success': formUpdate.email.$valid && formUpdate.email.$dirty}">
          <input type="email" class="form-control" name="email" placeholder="Email" ng-model="email" required>
          <p ng-show="formUpdate.email.$invalid && !formUpdate.email.$pristine" class="help-block">Email is required.</p>
          <p ng-show="formUpdate.email.$invalid && !formUpdate.email.$pristine" class="help-block">Please enter a valid email.</p>
          <i ng-show="formUpdate.email.$invalid && formUpdate.email.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="formUpdate.email.$valid && formUpdate.email.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>  
        </div>     
        <button type="submit" class="btn btn-primary btn-block" ng-disabled="!formUpdate.$valid" ng-class="{'btn-success': formUpdate.$valid}">Update</button>
      </form>
    </div>
    <br>
    <div class="col-md-4">
      <form action="" method="POST" role="form" name="chgPass" ng-controller="chgPassCtrl">
        <legend>Change Password</legend>
        <!-- CURRENT PASSWORD -->
        <div class="form-group has-feedback" ng-class="{'has-error':chgPass.oldpassword.$invalid && chgPass.oldpassword.$dirty,'has-success': chgPass.oldpassword.$dirty}">
          <input type="password" class="form-control" name="oldpassword" placeholder="Current password" ng-model="oldpassword" required>
          <p ng-show="chgPass.oldpassword.$error.required && chgPass.oldpassword.$dirty" class="help-block">Password is required.</p>
          <i ng-show="chgPass.oldpassword.$error.required && chgPass.oldpassword.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="chgPass.oldpassword.$dirty && chgPass.oldpassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- NEW PASSWORD -->
        <div class="form-group has-feedback" ng-class="{'has-error':chgPass.newpassword.$invalid && chgPass.newpassword.$dirty,'has-success': chgPass.newpassword.$dirty}">
          <input type="password" class="form-control" name="newpassword" placeholder="New password" ng-model="newpassword" required>
          <p ng-show="chgPass.newpassword.$error.required && chgPass.newpassword.$dirty" class="help-block">Password is required.</p>
          <i ng-show="chgPass.newpassword.$error.required && chgPass.newpassword.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="chgPass.newpassword.$dirty && chgPass.newpassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>
        <!-- CONFIRM PASSWORD -->
        <div class="form-group has-feedback" ng-class="{'has-error': chgPass.confirmpassword.$error.nomatch, 'has-success': chgPass.confirmpassword.$valid && chgPass.confirmpassword.$dirty}">
          <input type="password" class="form-control" name="confirmpassword" placeholder="Confirm password" ng-model="confirmpassword" match="newpassword">
          <p ng-show="chgPass.confirmpassword.$error.nomatch" class="help-block">Confirm password doesn't match!</p>          
          <i ng-show="chgPass.confirmpassword.$error.required && chgPass.confirmpassword.$dirty" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="chgPass.confirmpassword.$error.nomatch" class="glyphicon glyphicon-alert form-control-feedback"></i>
          <i ng-show="chgPass.confirmpassword.$valid && chgPass.confirmpassword.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></i>
        </div>    
        <button type="submit" class="btn btn-primary btn-block" ng-disabled="!chgPass.$valid" ng-class="{'btn-success': chgPass.$valid && !chgPass.$pristine}">Change Password</button>
      </form>
    </div>
    <br/>
    <div class="col-md-3">
     <div class="form-group has-feedback">            
            <input type="text" placeholder="Search posts..." class="form-control"> 
            <i class="glyphicon glyphicon-search form-control-feedback "></i>
     </div>
    <table class="table">
    <tr><td>
    <h4><a href="PostDetail.html">Post Title 1</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    <tr><td>
    <h4><a href="#">Post Title 2</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    <tr><td>
    <h4><a href="#">Post Title 3</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    <tr><td>
    <h4><a href="#">Post Title 4</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    <tr><td>
    <h4><a href="#">Post Title 5</a></h4>
    <p>HLV Miura đã giảm các bài tập thể lực</p>
    </td></tr>
    </table>
    </div>
  </div>
</div>
</div>

<br/>
<footer style="background-color: black; color: white; padding: 2em; margin-top: 2px;">Keep Moving Forward</footer>
</body>
</html>