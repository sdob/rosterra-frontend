(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name rosterraApp.directive:dashboardNavTop
    * @description
    * # dashboardNavTop
   */
  angular.module('rosterraApp').directive('dashboardNavTop', function(dashNav) {
    return {
      templateUrl: 'views/partials/dashboard/nav-top.html',
      controller: 'DashNavCtrl',
      restrict: 'E'
    };
  });

}).call(this);
