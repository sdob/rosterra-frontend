(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name rosterraApp.directive:profile
    * @description
    * # profile
   */
  angular.module('rosterraApp').directive('profile', function() {
    return {
      restrict: 'E',
      templateUrl: 'views/profile.html'
    };
  });

}).call(this);
