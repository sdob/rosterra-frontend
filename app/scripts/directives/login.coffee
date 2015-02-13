'use strict'

###*
 # @ngdoc directive
 # @name rosterraApp.directive:login
 # @description
 # # login
###
angular.module('rosterraApp')
  .directive('login', (cfg, $http, $cookieStore) ->
    templateUrl: 'views/partials/login.html'
    restrict: 'E'
  )
