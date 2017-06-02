
// *********** HOME CONTROLLER ***********
app.controller('HomeCtrl', function ($scope, $location,$routeParams,propertyFactory) {
		console.log('Found HomeCtrl!');

    $scope.things = ['Angular', 'Rails 4.1', 'Working', 'Together!!'];
});

// *********** LOGIN CONTROLLER ***********
app.controller('LoginCtrl', function ($scope, $location,$routeParams,userFactory) {
		console.log('Found LoginCtrl!');
		userFactory.landlordIndex(function(response) {
			$scope.all_landlords = response;
		});
		userFactory.tenantIndex(function(response) {
			$scope.all_tenants = response;
		})

		$scope.login = function()
    
});

// *********** LANDLORDS CONTROLLER ***********
app.controller('LandlordsCtrl', function ($scope, $location,$routeParams,propertyFactory) {
		console.log('Found LandlordsCtrl!');
		propertyFactory.landlordIndex(function(response) {
			$scope.all_landlords = response;
			console.log(response);
		})
});