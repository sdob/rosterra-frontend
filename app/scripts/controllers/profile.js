(function() {
  'use strict';

  /**
   * @ngdoc function
   * @name rosterraApp.controller:ProfileCtrl
   * @description
   * # ProfileCtrl
   * Controller of the rosterraApp
   */
  angular.module('rosterraApp').controller('ProfileCtrl', function(cfg, api, $scope, localStorageService, $http, $timeout) {
    console.log("Initializing profile controller");
    $scope.loading = false;
    api.getCountries().success(function(data) {
      $scope.countries = data;
    });
    api.getEmployee(localStorageService.get('user_id')).success(function(data) {
      console.log(data);
      $scope.user = data;
    });

    api.getEmployments({
      'employee': localStorageService.get('user_id')
    }).success(function(data) {
      console.log(data);
      $scope.employments = data;
      $scope.employments.forEach(function(o) {
        o.imageUrl = "http://lorempixel.com/60/40/business/" + o.company + "/";
        o.role = o.is_manager ? "Manager" : "Staff";
        // TODO: do something with this information
      });
    });
    $scope.save = function() {
      $scope.saveStateInfo = "Saving";
      api.patchUser($scope.user.id, $scope.user).success(function(data) {
        $timeout(function() {
          $scope.saveStateInfo = 'Changes saved';
        }, 400);
      });
    };
  });

}).call(this);
