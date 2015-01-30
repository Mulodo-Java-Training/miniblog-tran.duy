<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en" ng-app="ui.bootstrap.demo">
<head>
  <title>Register</title>
  
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
    <script src="js/datetimepicker.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
            
</head>
<body>


<div class="container">
  <div class="jumbotron">
    <div class="row">
      <div class="col-md-3" style="background-color:pink">
        <h1>Col 1</h1>
      </div>
      <div class="col-md-6" centered style="background-color:yellow">
	    <div ng-controller="DatepickerDemoCtrl">	      
	        <form action="">
	          <table class="table table-bordered table-hover">
	            <tr>
	              <td colspan="4">Đăng Kí</td>
  	            </tr>          
	            <tr>
	              <td>User Name</td>            
	              <td> 
	                <div class="form-group has-success">
	                  <div class="input-group">
	                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                      <input type="text" class="form-control" id="username_form">
	                  </div>
	                </div>
	              </td>
	            </tr>
	            <tr>
	              <td>Password</td>
	              <td> 
	                <div class="form-group has-success">
	                  <div class="input-group">
	                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                      <input type="password" class="form-control" id="password_form">
	                  </div>
	                </div>
	              </td>
	            </tr>
	            <tr>
	              <td>Confirm Password
	              <td> 
	                <div class="form-group has-success">
	                  <div class="input-group">
	                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                      <input type="password" class="form-control" id="confirm_password_form">
	                  </div>
	                </div>
	              </td>
	            </tr>
	            <tr>
	              <td>First Name</td>
	              <td> 
	                <div class="form-group has-success">
	                  <div class="input-group">
	                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	                      <input type="text" class="form-control" id="firstname_form">
	                  </div>
	                </div>
	              </td>
	            </tr>
	            <tr>
	              <td>Last Name</td>          
	              <td> 
	                <div class="form-group has-success">
	                  <div class="input-group">
	                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	                      <input type="text" class="form-control" id="lastname_form">
	                  </div>
	                </div>
	              </td>
	            </tr>
	            <tr>
	              <td>Sex</td>
	              <td> 
	                <div class="form-group">
	                  <label>
	                    <input type="radio" name="gender" checked>Male
	                  </label>                 
	                  <label>
	                    <input type="radio" name="gender">Female
	                  </label>                                           
	                </div>
	              </td>
	            </tr>
	            <tr>
	              <td>Birth Date</td>          
	              <td> 
	                <div class="form-group has-success">  
	                  <div class="input-group"> 
	                  <span class="input-group-btn">
                      <button type="button" class="btn btn-success" ng-click="open($event)">
                      <i class="glyphicon glyphicon-calendar"></i></button>
                    </span>     	                
	                <input type="text" class="form-control" datepicker-popup="{{format}}" 
	                    ng-model="dt" is-open="opened" min-date="1970-01-01" max-date="'2015-06-22'" 
	                    datepicker-options="dateOptions" date-disabled="disabled(date, mode)" 
	                    ng-required="true" close-text="Close" />
	                	
	                </div>
	                </div>             
	              </td>
	            </tr>
	            <tr>
	              <td>Email</td>
	            <td> 
	              <div class="form-group has-success">
	                <div class="input-group">
	                  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	                    <input type="text" class="form-control" id="confirm_password_form">
	                </div>
	              </div>
	            </td>
	          </tr>
	            <tr>
	              <td colspan="4">
	                <button type="button" class="btn btn-success btn-lg btn-block">Register</button>
	              </td>
	            </tr>
	        </table>
	        </form>
	    </div>
	  </div>
	  <div class="col-md-3" style="background-color:blue">
	    <h1>Col 3</h1> 
	  </div>
	</div>
  </div>
</div>
</body>
</html>