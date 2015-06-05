(function() {
  'use strict';

  /**
    * @ngdoc function
    * @name rosterraApp.controller:ModalauthCtrl
    * @description
    * # ModalauthCtrl
    * Controller of the rosterraApp
   */
  angular.module('rosterraApp').controller('ModalauthCtrl', function(authService, $scope, $modalInstance, $http, $location) {
    $scope.submit = function() {
      var user = {
        'username': $scope.username,
        'password': $scope.password
      };
      authService.login(user).success(function() {
        $modalInstance.close();
        return $location.path('/dash');
      }).error(function(data, status, headers) {
        console.log("error: '" + status + "'");
      });
    };
  });

}).call(this);
