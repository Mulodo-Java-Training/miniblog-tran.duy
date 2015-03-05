

// create angular app
var validationApp = angular.module('validationApp', []);

//create angular controller
validationApp.controller('registerCtrl', function ($scope) {
	
});

validationApp.controller('myProfileCtrl', function ($scope) {
	
});

//create custom directive
validationApp.directive('match', function($parse) {
  return {
    require: 'ngModel',
    link: function(scope, elem, attrs, ctrl) {
      scope.$watch(function() {        
        return $parse(attrs.match)(scope) === ctrl.$modelValue;
      }, function(currentValue) {
        ctrl.$setValidity('nomatch', currentValue);
      });
    }
  };
});

validationApp.controller('chgPassCtrl', function ($scope) {
	$scope.newpassword='';
	$scope.confirmpassword='';
});
