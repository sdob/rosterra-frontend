'use strict'

###*
 # @ngdoc service
 # @name rosterraApp.httpInterceptor
 # @description
 # # httpInterceptor
 # Factory in the rosterraApp.
###
angular.module('rosterraApp')
  .factory 'httpInterceptor', ($q, $location) ->
    request: (config) -> config || $q.when config
    requestError: (rejection) -> $q.reject rejection
    response: (response) -> response || $q.when response
    responseError: (response) -> 
      if response.status == 401
        $location.path('/login')
        $q.reject response
      else
        $q.reject response
