app.controller('ajaxCtrl', ['$scope', '$http', function ($scope, $http) {
	$http.get('apis/v1/posts')
			.success(function(response) {
				$scope.listPosts = response;
			});
}]);