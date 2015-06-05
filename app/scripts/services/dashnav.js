(function() {
  'use strict';

  /**
    * @ngdoc service
    * @name rosterraApp.dashNav
    * @description
    * # dashNav
    * Factory in the rosterraApp.
   */
  angular.module('rosterraApp').factory('dashNav', function(authService, api, $location) {
    console.log("dashNav initializing");
    return {
      logout: function() {
        return authService.logout();
      },
      showProfile: function() {
        $location.path('/profile');
      },
      showDash: function() {
        $location.path('/dash');
      }
    };
  });

}).call(this);
