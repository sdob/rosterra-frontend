(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name rosterraApp.directive:splashPageBlurb
    * @description
    * # splashPageBlurb
   */
  angular.module('rosterraApp').directive('splashPageBlurb', function() {
    return {
      templateUrl: 'views/partials/splashblurb.html',
      restrict: 'E'
    };
  });

}).call(this);
