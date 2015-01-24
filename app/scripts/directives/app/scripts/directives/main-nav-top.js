'use strict';

/**
 * @ngdoc directive
 * @name directivesApp.directive:mainNavTop
 * @description
 * # mainNavTop
 */
angular.module('directivesApp')
  .directive('mainNavTop', function () {
    return {
      template: '<div></div>',
      restrict: 'E',
      link: function postLink(scope, element, attrs) {
        element.text('this is the mainNavTop directive');
      }
    };
  });
