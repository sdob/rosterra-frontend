'use strict'

###*
# @ngdoc overview
# @name rosterraApp
# @description
# # rosterraApp
#
# Main module of the application.
###
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
    'ui.bootstrap'
    ])
    .config ($routeProvider, $httpProvider) ->
        $httpProvider.interceptors.push 'httpInterceptor'
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
                templateUrl: 'views/login.html'
                controller: 'AuthCtrl'
            .otherwise
            redirectTo: '/'
