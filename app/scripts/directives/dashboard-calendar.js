(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name rosterraApp.directive:dashboardCalendar
    * @description
    * # dashboardCalendar
   */
  angular.module('rosterraApp').directive('dashboardCalendar', function() {
    return {
      templateUrl: 'views/partials/dashboard/calendar.html',
      controller: 'DashCalendarCtrl',
      restrict: 'E'
    };
  });

}).call(this);
