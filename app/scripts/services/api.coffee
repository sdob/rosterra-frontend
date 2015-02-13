'use strict'

###*
 # @ngdoc service
 # @name rosterraApp.api
 # @description
 # # api
 # Service in the rosterraApp.
###

angular.module('rosterraApp')
  .factory 'api', ['cfg', '$http', (cfg, $http) ->
    {
      #########################################################################
      # Methods with variable parameters
      #########################################################################
      getActivities: (params) ->
        $http.get(cfg.apiUrl + '/activities/', {params: params})
      getCompanies: (params) ->
        $http.get(cfg.apiUrl + '/companies/', {params: params})
      getEmployees: (params) ->
        $http.get(cfg.apiUrl + '/employees/', {params: params})
      getRosterEntries: (params) ->
        $http.get(cfg.apiUrl + '/roster-entries/', {params: params})
      getLocations: (params) ->
        $http.get((cfg.apiUrl + '/locations/'), {params: params})
      getEmployments: (params) ->
        $http.get(cfg.apiUrl + '/employments/', {params: params})
      #########################################################################
      # Methods with fixed parameters
      #########################################################################
      getProfile: (user_id) ->
        $http.get(cfg.apiUrl + '/employees/' + user_id + '/profile/')
    }
  ]
