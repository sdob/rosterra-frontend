'use strict'

###*
 # @ngdoc directive
 # @name rosterraApp.directive:dashboardCalendar
 # @description
 # # dashboardCalendar
###
angular.module('rosterraApp')
  .directive('dashboardCalendar', ->
    templateUrl: 'views/partials/dashboard/calendar.html'
    controller: 'DashCalendarCtrl'
    restrict: 'E'
  )
