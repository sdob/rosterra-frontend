(function() {
  'use strict';

  /**
    * @ngdoc service
    * @name rosterraApp.api
    * @description
    * # api
    * API routes
   */
  angular.module('rosterraApp').factory('api', [
    'cfg', '$http', function(cfg, $http) {
      return {

        authenticate: function (username, password) {
          return $http.post(cfg.apiUrl + "authenticate", {
            params: {username: username, password: password}
          });
        },

        /*
         * Methods with variable querystrings
         */

        // GET a list of Activity objects available to the user
        getActivities: function(params) {
          return $http.get(cfg.apiUrl + "activities/", {
            params: params
          });
        },
        // GET a list of Company objects available to the user
        getCompanies: function(params) {
          return $http.get(cfg.apiUrl + "companies/", {
            params: params
          });
        },
        // GET a list of Employee objects available to the user
        getEmployees: function(params) {
          return $http.get(cfg.apiUrl + "employees/", {
            params: params
          });
        },
        // GET a list of RosterEntry objects available to the user
        getRosterEntries: function(params) {
          return $http.get(cfg.apiUrl + "roster-entries/", {
            params: params
          });
        },
        // GET a list of Location objects available to the user
        getLocations: function(params) {
          return $http.get(cfg.apiUrl + "locations/", {
            params: params
          });
        },
        // GET a list of Employment objects available to the user
        getEmployments: function(params) {
          return $http.get(cfg.apiUrl + "employments/", {
            params: params
          });
        },

        // GET a list of Country objects
        getCountries: function(params) {
          return $http.get(cfg.apiUrl + "countries/", {
            params: params
          });
        },

        // PATCH a RosterEntry
        patchRosterEntry: function (id, start, end) {
          return $http.patch(cfg.apiUrl + "roster-entries/" + id + "/", {start: start, end: end});
        },

        /*
         * Methods with fixed query strings
         */

        // GET a single Employee object with ID 'userId'
        getEmployee: function(userId) {
          return $http.get(cfg.apiUrl + "employees/" + userId + "/");
        },

        // PATCH a single Employee object with ID 'userId', using
        // the data in 'data' for a partial update
        patchEmployee: function(userId, data) {
          return $http.patch(cfg.apiUrl + "employees/" + userId, data);
        }
      };
    }
  ]);

}).call(this);
