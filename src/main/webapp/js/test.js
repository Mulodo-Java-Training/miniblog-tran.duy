app.config(function ($routeProvider, $locationProvider) {
    $locationProvider.html5Mode(true);

    $routeProvider.when("/", { templateUrl: "/pages/Suc1.html" }).
                   when("/profile", { templateUrl: "/pages/Test.html" }).        
                   otherwise({ redirectTo: '/' });

});