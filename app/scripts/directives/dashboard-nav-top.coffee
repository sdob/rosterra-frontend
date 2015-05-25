'use strict'

###*
 # @ngdoc directive
 # @name rosterraApp.directive:dashboardNavTop
 # @description
 # # dashboardNavTop
###
angular.module('rosterraApp')
  .directive('dashboardNavTop', (dashNav) ->
    templateUrl: 'views/partials/dashboard/nav-top.html'
    controller: 'DashNavCtrl'
    restrict: 'E'
  )
