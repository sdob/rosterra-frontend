(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name rosterraApp.directive:login
    * @description
    * # login
   */
  angular.module('rosterraApp').directive('login', function(cfg, $http, $cookieStore) {
    return {
      templateUrl: 'views/partials/login.html',
      restrict: 'E'
    };
  });

}).call(this);
