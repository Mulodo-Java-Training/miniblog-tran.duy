<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Trang Chủ</title>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>  
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
  

</head>
<body>

<!-- navbar -->
<nav class="navbar navbar-inverse "> <!-- "navbar-fixed-top" -->
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
          data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <h1><a href="#" style="font-size:45px;padding:10px;">Mini Blog</a></h1>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <form class="navbar-form navbar-right">
        <table>
        <tr>
        
        <td style="padding:5px">
          <div class="form-group has-feedback">
            
            <input type="text" placeholder="User name" class="form-control" id="username"> 
            <span class="glyphicon glyphicon-user form-control-feedback "></span>
          </div>
          </td>
          <td style="padding:5px">
          <div class="form-group has-feedback">
            <input type="password" placeholder="Password" class="form-control">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          </td>
         <td style="padding:5px;">
          <button type="submit" class="btn btn-success">Sign in</button>
          </td>
          </tr>
          <tr>
          <td style="padding:5px">
         <div>
          <label style="color:#428BCA">
            <input type="checkbox" value="remember-me"> Remember me
          </label>
         </div>
         </td>
         <td style="padding:5px">
         <div>
          <label>
            <a href="#">Forget your password!</a>
          </label>
         </div>
         </td>
         </tr>   
         </table>
      </form>
    </div>
  </div>
</nav>

<div class="page-header">
  <h1>Kiểm tra header nhá các bạn <small>Thành công?</small></h1>
  <a href="register.htm">Đăng ký</a> | <a href="myAccount.htm">My Account</a> 
  | <a href="posts.htm">Posts</a> | <a href="comments.htm">Comments</a>
  | <a href="test.htm">Test</a> | 
  
</div>

<div class="jumbotron">
<div class="container">

  <h1>Trang Chủ</h1>
  <h1>This is Home Page</h1>
  <h1>Trang này tạm thời không bị lỗi font</h1>
  <p>This part is inside a .container class.</p> 
  <p>The .container class provides a responsive fixed width container.</p> 
  <br/>
  <div ng-app="newApp" ng-controller="newCtrl">
      <div ng-include="'jsp/Trang1.jsp'"></div>
      <a href="t2.htm">Tới trang 2</a>
      <a href="t1.htm">Tới trang 1</a>
      <div ng-include="'t1.htm'"></div>
      <div ng-include="'t2.htm'"></div>
      
  </div>          
</div>
</div>



<div class="container">
  <h2>Contextual Backgrounds</h2>
  <p>Use the contextual background classes to provide "meaning through colors":</p>
  <p class="bg-primary">This text is important.</p>
  <p class="bg-success">This text indicates success.</p>
  <p class="bg-info">This text represents some information.</p>
  <p class="bg-warning">This text represents a warning.</p>
  <p class="bg-danger">This text represents danger.</p>
</div>

<div class="form-group has-success has-feedback">
  <label class="control-label" for="inputGroupSuccess1">Input group with success</label>
  <div class="input-group">
    <span class="input-group-addon">User Name</span>
    <input type="text" class="form-control" id="inputGroupSuccess1" aria-describedby="inputGroupSuccess1Status">
  </div>
  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
  <span id="inputGroupSuccess1Status" class="sr-only">(success)</span>
</div>

<br/>
<div class="container">
<button type="button" class="btn btn-default" data-toggle="tooltip" 
data-placement="right" title="Tooltip on right">Tooltip on right</button>
<br/>
<input type="text" data-toggle="tooltip" data-placement="right" title="Chet may ne!" />

<br/>

<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Tooltip on left">Tooltip on left</button>

<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Tooltip on top">Tooltip on top</button>

<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom">Tooltip on bottom</button>

<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="Tooltip on right">Tooltip on right</button>

<br/>
<button type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">Click to toggle popover</button>
<br/><br/><br/><br/>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/images.jpg" alt="...">
      <div class="carousel-caption">
  asdfffffff
      </div>
    </div>
    <div class="item">
      <img src="images/1.jpg" alt="">
      <div class="carousel-caption">
       adfasdfasdf
      </div>
    </div>
    <div class="item"><img src="images/pandas.jpg"/></div>
     
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br/>
</div>
<script>
var app = angular.module("newApp", []);

app.controller("newCtrl", function($scope) {
    $scope.firstName = "John";
    $scope.lastName = "Doe";
});

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
$(function () {
	  $('[data-toggle="popover"]').popover()
	});	
</script>

   
</body>
</html>