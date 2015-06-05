(function() {
  'use strict';

  /**
   * @ngdoc service
   * @name rosterraApp.authService
   * @description
   * # authService
   * Factory in the rosterraApp.
   */
  angular.module('rosterraApp').factory('authService', [
    'cfg', 'localStorageService', '$http', '$location', function(cfg, localStorageService, $http, $location) {
      return {
        isLoggedIn: function() {
          var isloggedin = !!(localStorageService.get('token') && localStorageService.get('user_id'));
          return isloggedin;
        },
        login: function(userObj) {
          console.log("authService: logging in");
          return $http.post(cfg.authUrl, userObj).success(function(data, status, headers, config) {
            //console.log("token: '" + data.token + "'");
            //console.log("user_id: " + data.user);
            localStorageService.set('token', data.token);
            localStorageService.set('user_id', data.user);
            $http.defaults.headers.common.Authorization = "Token " + localStorageService.get('token');
            //console.log("Authorization header");
            //console.log($http.defaults.headers.common.Authorization);
          });
        },
        logout: function() {
          console.log("authService: removing token");
          localStorageService.remove('token');
          localStorageService.remove('user_id');
          delete $http.defaults.headers.common.Authorization;
          $location.path('/');
        }
      };
    }
  ]);

}).call(this);
