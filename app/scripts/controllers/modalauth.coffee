'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:ModalauthCtrl
 # @description
 # # ModalauthCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'ModalauthCtrl', ($scope, $modalInstance, $http, $cookieStore) ->
    $scope.submit = () ->
      user = {
        'username': $scope.username
        'password': $scope.password
      }
      # Submit the user data
      $http
        .post 'http://localhost:8000/authenticate', user
        .success (data, status, headers, config) ->
          console.log "token: '" + data.token + "'"
          $cookieStore.put 'token', data.token
          $modalInstance.close()
          #$location.path '/'
        .error (data, status, headers, confi) ->
          console.log "error: '" + status + "'"
