(function () {
  'use strict';
  //var BASE_URL = 'https://rosterra-server.herokuapp.com/';
  var BASE_URL = "http://localhost:5000/";
  angular.module('rosterraApp', [
    'ngAnimate', 'ngAria', 'ngMessages', 'ngResource', 'ngRoute',
    'ngSanitize', 'ngTouch', 'door3.css', 'ui.bootstrap', 'ui.calendar',
    'googlechart', 'angularSpinner', 'LocalStorageModule'
  ])
  .constant('cfg', {
    apiUrl: BASE_URL,
    authUrl: BASE_URL + 'authenticate',
    events: {
      EVENT_COMPANY_CHANGE: 'event:company-change'
    }
  }).config(function ($routeProvider) {
    $routeProvider.when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl',
      css: 'styles/main.css'
    }).when('/dash', {
      templateUrl: 'views/dash.html',
      controller: 'DashCtrl'
    }).when('/login', {
      templateUrl: 'views/partials/login.html',
      controller: 'ModalauthCtrl'
    }).when('/profile', {
      templateUrl: 'views/profile.html',
      controller: 'ProfileCtrl',
      css: 'styles/dashboard.css'
    }).otherwise({
      redirectTo: '/'
    });
  }).run(function ($http) {
    // TODO: pull this out of here
    //$http.defaults.headers.common.Authorization = 'Token ' + $cookieStore.get('token');
  });
}).call(this);
