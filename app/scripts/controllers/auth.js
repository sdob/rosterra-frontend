(function() {
  'use strict';

  /**
    * @ngdoc function
    * @name rosterraApp.controller:AuthctrlCtrl
    * @description
    * # AuthCtrl
    * Controller of the rosterraApp
   */
  angular.module('rosterraApp').controller('AuthCtrl', [
    '$scope', 'localStorageService', '$http', '$location', '$modal', function($scope, localStorageService, $http, $location, $modal) {
      $scope.isLoggedIn = function () {
        //return !!$cookieStore.get('token');
        return !!localStorageService.get('token');
      };
      $scope.logout = function () {
        console.log("logging out");
        localStorageService.remove('token');
        localStorageService.remove('user_id');
        $location.path('/');
      };
      $scope.openModal = function () {
        console.log("opening authentication modal");
        $modal.open({
          templateUrl: 'views/partials/login.html',
          controller: 'ModalauthCtrl',
          backdropClass: 'dark',
          resolve: {}
        });
      };
    }
  ]);

}).call(this);
