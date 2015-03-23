app.controller('ajax1Ctrl', ['$scope', '$http', function ($scope, $http) {
			$http.get('apis/v1/users/list')
					.success(function(response) {
						$scope.listName = response;
					});
		}]);