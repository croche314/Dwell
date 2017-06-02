var app = angular.module('app', ['ngRoute','templates']);
console.log('Found app.js!');

// *********** ROUTES ***********
app.config(function($routeProvider,$locationProvider) {
	$routeProvider
	.when('/', {
		templateUrl: 'partials/_home.html',
		controller: 'HomeCtrl'
	})
	.when('/login', {
		templateUrl: 'partials/login/_login.html',
		controller: 'LoginCtrl'
	})
	.when('/landlords', {
		templateUrl: 'partials/landlords/_index.html',
		controller: 'LandlordsCtrl'
	})
	.otherwise('/')
	$locationProvider.html5Mode({
		enabled: true,
  	requireBase: false
		});
});
