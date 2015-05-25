'use strict'

###*
# @ngdoc overview
# @name rosterraApp
# @description
# # rosterraApp
#
# Main module of the application.
###
BASE_URL = 'http://localhost:8000/'
angular
    .module('rosterraApp', [
      'ngAnimate',
      'ngAria',
      'ngCookies',
      'ngMessages',
      'ngResource',
      'ngRoute',
      'ngSanitize',
      'ngTouch',
      'door3.css',
      'ui.bootstrap',
      'ui.calendar',
      'googlechart',
      'angularSpinner'
    ])
    .constant 'cfg', {
      baseUrl: BASE_URL
      authUrl: BASE_URL + "/authenticate/"
      apiUrl: BASE_URL
    }
    .config ($routeProvider, $httpProvider) ->
        $routeProvider
            .when '/',
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'
                css: 'styles/main.css'
            .when '/dash',
                templateUrl: 'views/dash.html'
                controller: 'DashCtrl'
                css: 'styles/dashboard.css'
            .when '/login',
              templateURL: 'views/partials/login.html'
              controller: 'ModalauthCtrl'
            .when '/profile',
              templateUrl: 'views/profile.html'
              controller: 'ProfileCtrl'
              css: 'styles/dashboard.css'
            .otherwise
            redirectTo: '/'
      .run ($cookieStore, $http, $injector, authService) ->
        # On 'startup' (i.e., page load or refresh), check whether we have
        # an auth token in local storage and, if so, insert a header
        console.log 'app running'
        if $cookieStore.get 'token'
          $http.defaults.headers.common['Authorization'] = 'Token ' + $cookieStore.get 'token'
