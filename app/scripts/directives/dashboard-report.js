(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name rosterraApp.directive:dashboardReport
    * @description
    * # dashboardReport
   */
  angular.module('rosterraApp').directive('dashboardReport', function() {
    return {
      templateUrl: 'views/partials/dashboard/report.html',
      controller: 'DashReportCtrl',
      restrict: 'E'
    };
  });

}).call(this);
