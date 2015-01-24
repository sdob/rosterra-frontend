'use strict'

###*
 # @ngdoc directive
 # @name rosterraApp.directive:dashboardSidebar
 # @description
 # # dashboardSidebar
###
angular.module('rosterraApp')
  .directive('dashboardSidebar', ->
    templateUrl: 'views/partials/dashboard-sidebar.html'
    restrict: 'E'
  )
