<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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