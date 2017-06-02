app.factory('propertyFactory', function($http) {
	var factory = {};
	factory.all_landlords = []

	// Landlords Index (Get All Landlords)
	factory.landlordIndex = function(callback) {
		$http.get('/landlords.json').then(function(returned_data) {
			factory.all_landlords = returned_data;
			callback(returned_data);
		});
	}
	return factory;
})

app.factory('userFactory', function($http) {
	var factory = {};

	// Landlords Index (Get All Landlords)
	factory.landlordIndex = function(callback) {
		factory.all_landlords = [];
		$http.get('/landlords.json').then(function(returned_data) {
			factory.all_landlords = returned_data.data;
			callback(returned_data.data);
		});
	}

	// Tenant Index (Get All Tenants)
	factory.tenantIndex = function(callback) {
		factory.all_tenants = [];
		$http.get('/tenants.json').then(function(returned_data) {
			factory.all_tenants = returned_data.data;
			callback(returned_data.data)
		})
	}

	return factory;
})