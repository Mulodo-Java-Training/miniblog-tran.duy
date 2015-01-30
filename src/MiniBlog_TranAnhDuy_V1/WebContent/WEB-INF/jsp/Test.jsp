<!doctype html>
<html ng-app="ui.bootstrap.demo">
  <head>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
    <script src="js/datetimepicker.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>

<div class="container">
  <div class="jumbotron">
<div ng-controller="DatepickerDemoCtrl">
    <pre>Selected date is: <em>{{dt | date:'fullDate' }}</em></pre>

    <h4>Inline</h4>
    <div style="display:inline-block; min-height:290px;">
        <datepicker ng-model="dt" min-date="minDate" show-weeks="true" class="well well-sm"></datepicker>
    </div>

    <h4>Popup</h4>
    <div class="row">
        <div class="col-md-6">
            <p class="input-group">
              <input type="text" class="form-control" datepicker-popup="{{format}}" ng-model="dt" 
              is-open="opened" min-date="minDate" max-date="'2015-06-22'" 
              datepicker-options="dateOptions" date-disabled="disabled(date, mode)" 
              ng-required="true" close-text="Close" />
              <span class="input-group-btn">
                <button type="button" class="btn btn-default" ng-click="open($event)">
                <i class="glyphicon glyphicon-calendar"></i></button>
              </span>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <label>Format:</label> <select class="form-control" ng-model="format" ng-options="f for f in formats"><option></option></select>
        </div>
    </div>

    <hr />
    <button type="button" class="btn btn-sm btn-info" ng-click="today()">Today</button>
    <button type="button" class="btn btn-sm btn-default" ng-click="dt = '2009-08-24'">2009-08-24</button>
    <button type="button" class="btn btn-sm btn-danger" ng-click="clear()">Clear</button>
    <button type="button" class="btn btn-sm btn-default" ng-click="toggleMin()" tooltip="After today restriction">Min date</button>
</div>
</div>
</div>
  </body>
</html>