

// create angular app
var app = angular.module('blogUserApp', ['ngAnimate','ngRoute']);

app.controller('homeCtrl', ['$scope', '$http', function ($scope, $http) {

	$scope.showAllPosts = true;
	$scope.showPostDetail = false;
	$scope.showPostsOfAuthor = false;
	$scope.showMyPosts = false;
	$scope.showMyProfile = false;
	
	// when click <a href> welcome
	$scope.welcome = function() {
		$scope.showAllPosts = true;
		$scope.showPostDetail = false;
		$scope.showPostsOfAuthor = false;
		$scope.showMyPosts = false;
		$scope.showMyProfile = false;
	};
	
	// when click <a href> post detail with postId
	$scope.postDetail = function(postId) {	
		$http.get('apis/v1/post/' + postId)
			.success(function(response) {
				$scope.detailPost = response;
			});
		$scope.error = "";		
		$http.get('apis/v1/post/' + postId + '/comments')
			.success(function(data, status){
				if (status == 200) {
					$scope.nocomment = data;
					$scope.comments = "";					
				} else {
					$scope.comments = data;
					$scope.nocomment = "";
				}								
			})
			.error(function(data){
				$scope.error = data;
			});		
		$scope.showAllPosts = false;
		$scope.showPostDetail = true;	
		$scope.showPostsOfAuthor = false;
		$scope.showMyPosts = false;
		$scope.showMyProfile = false;
	};
	
	//when click <a href> author's name
	$scope.getPostsByAuthor = function(userId) {
		$http.get('apis/v1/posts/users/' + userId)
			.success(function(data, status) {
				if (status == 200) {
					$scope.nopost = data;
					$scope.postsOfAuthor = "";
					$scope.AuthorName = "";
				} else {
					$scope.postsOfAuthor = data;
					$scope.nopost = "";
					$scope.AuthorName = data[0].firstName + " " + data[0].lastName;
				}				
			})
			.error(function(data) {
				$scope.error = data;
			});
		$scope.showAllPosts = false;
		$scope.showPostDetail = false;	
		$scope.showPostsOfAuthor = true;	
		$scope.showMyPosts = false;
		$scope.showMyProfile = false;
	};
	
	$scope.myProfile = function() {
		$scope.showAllPosts = false;
		$scope.showPostDetail = false;	
		$scope.showPostsOfAuthor = false;	
		$scope.showMyPosts = false;
		$scope.showMyProfile = true;
	};
	
	$scope.myPosts = function() {
		$scope.showAllPosts = false;
		$scope.showPostDetail = false;	
		$scope.showPostsOfAuthor = false;	
		$scope.showMyPosts = true;
		$scope.showMyProfile = false;
	};
	
}]);

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
	
	$scope.user = {
			username: "",
			password: "",
			firstname: "",
			lastname: "",
			birthdate: "",
			gender: "",
			email: ""
	};
	
	
	
	var originUser = angular.copy($scope.user);
	
	$scope.submit = function(user){
		$scope.show = true;
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
			$scope.successMessage = data;
			$scope.err0 = "";
			$scope.show = false;
			$scope.user = angular.copy(originUser);
			$scope.registerForm.$setPristine();
			})
		.error(function(data, status) {
			if (status < 500) {
				$scope.successMessage = "";
				$scope.err0 = "";
				$scope.err1 = data[0];
				$scope.err2 = data[1];
				$scope.err3 = data[2];
				$scope.err4 = data[3];
				$scope.err5 = data[4];
				$scope.err6 = data[5];
			} else if (status >= 500) {
				$scope.successMessage = "";
				$scope.err0 = data;
				$scope.err1 = "";
				$scope.err2 = "";
				$scope.err3 = "";
				$scope.err4 = "";
				$scope.err5 = "";
				$scope.err6 = "";
			}
		});
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


