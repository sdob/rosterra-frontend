'use strict'

###*
 # @ngdoc directive
 # @name rosterraApp.directive:dashboardReport
 # @description
 # # dashboardReport
###
angular.module('rosterraApp')
  .directive('dashboardReport', ->
    templateUrl: 'views/partials/dashboard/report.html'
    controller: 'DashReportCtrl'
    restrict: 'E'
  )
