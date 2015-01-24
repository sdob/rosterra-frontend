'use strict'

###*
 # @ngdoc directive
 # @name rosterraApp.directive:dashboardNavTop
 # @description
 # # dashboardNavTop
###
angular.module('rosterraApp')
  .directive('dashboardNavTop', ->
    templateUrl: 'views/partials/dashboard-nav-top.html'
    restrict: 'E'
  )
