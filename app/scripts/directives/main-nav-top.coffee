'use strict'

###*
 # @ngdoc directive
 # @name rosterraApp.directive:mainNavTop
 # @description
 # # mainNavTop
###
angular.module('rosterraApp')
  .directive('mainNavTop', ->
    templateUrl: 'views/partials/main-nav-top.html'
    restrict: 'E'
  )
