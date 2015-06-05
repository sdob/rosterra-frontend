(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name rosterraApp.directive:dashboardSidebar
    * @description
    * # dashboardSidebar
   */
  angular.module('rosterraApp').directive('dashboardSidebar', function() {
    return {
      templateUrl: 'views/partials/dashboard/sidebar.html',
      restrict: 'E'
    };
  });

}).call(this);
