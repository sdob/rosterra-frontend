'use strict'

###*
 # @ngdoc directive
 # @name rosterraApp.directive:profile
 # @description
 # # profile
###
angular.module 'rosterraApp'
  .directive 'profile', ->
    restrict: 'E'
    templateUrl: 'views/profile.html'
