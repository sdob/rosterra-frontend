(function() {
  'use strict';

  /**
    * @ngdoc function
    * @name rosterraApp.controller:MainCtrl
    * @description
    * # MainCtrl
    * Controller of the rosterraApp
   */
  angular.module('rosterraApp').controller('MainCtrl', function(authService, $scope, $location) {
    console.log("MainCtrl initializing");
    if (authService.isLoggedIn()) {
      return $location.path('/dash');
    }
  });

}).call(this);
