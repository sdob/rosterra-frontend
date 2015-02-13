'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:ModalauthCtrl
 # @description
 # # ModalauthCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'ModalauthCtrl', (authService, $scope, $modalInstance, $http, $cookieStore, $location) ->
    $scope.submit = () ->
      user = {
        'username': $scope.username
        'password': $scope.password
      }
      # Submit the user data --- pass this to authService and let it worry
      # about the details. If login works, close up the modal and
      # relocate to the dashboard
      authService.login(user)
        .success (data, status, headers, config) ->
          $modalInstance.close()
          $location.path '/dash'
        .error (data, status, headers, config) ->
          console.log "error: '" + status + "'"
