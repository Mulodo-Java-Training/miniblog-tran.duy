

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

app.controller('testSubmitCtrl', ['$scope', '$http', function($scope, $http) {
	
}]);

app.controller('registerCtrl', ['$scope', '$http', function ($scope, $http) {
	$scope.submit1 = function(){
		$http({
			method: 'GET',
			url: 'apis/v1/posts'
		})
		.success(function(data, status, headers, config) {
		    $scope.list = data;
		    $scope.msg = status;
		    $scope.msg1 = headers;
		    $scope.msg2 = config;
		  });
	};
	
	$scope.submit = function(user){
		$http({
			method : 'POST',
			url : 'apis/v1/users',
			data : $.param(user), // pass in data as strings
			// set the headers so angular passing info as form data
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
			}
		})
		.success(function(data) {
			console.log(data);
			$scope.user.message = data;
			console.log($scope);
			})
		.error(function(data) {
			console.log(data);
			$scope.user.message = data;
			console.log($scope);
		});
		$scope.message = "123456";
		};
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


