(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name rosterraApp.directive:mainNavTop
    * @description
    * # mainNavTop
   */
  angular.module('rosterraApp').directive('mainNavTop', function() {
    return {
      templateUrl: 'views/partials/main-nav-top.html',
      restrict: 'E'
    };
  });

}).call(this);
