app.controller('testCtrl', ['$scope', function ($scope) {
			
	
		}]);

app.controller('testSubmitCtrl', ['$scope', '$http', function($scope, $http) {
	$scope.submit = function(){
		$http.get('apis/v1/posts')
		.success(function(response) {
			$scope.list = response;
		});
	};
}]);