

// create angular app
var app = angular.module('blogApp', []);

//create angular controller
app.controller('allPostsCtrl', ['$scope', '$http', function ($scope, $http) {
	$http.get('apis/v1/posts')
	.success(function(response) {
		$scope.listPosts = response;
	});

}]);

app.controller('searchPostsCtrl', ['$scope', '$http', function ($scope, $http) {
	$http.get('apis/v1/posts')
	.success(function(response) {
		$scope.listSearchPosts = response;
	});
}]);

app.controller('registerCtrl', ['$scope', function ($scope) {	
	
}]);

app.controller('myProfileCtrl', ['$scope', function ($scope) {	
	
}]);

app.controller('chgPassCtrl', ['$scope', function ($scope) {	
	$scope.newpassword='';
	$scope.confirmpassword='';
}]);

//create custom directive
app.directive('match', function($parse) {
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


