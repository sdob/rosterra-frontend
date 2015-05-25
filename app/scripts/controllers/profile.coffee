'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:ProfileCtrl
 # @description
 # # ProfileCtrl
 # Controller of the rosterraApp
###
angular.module 'rosterraApp'
  .controller 'ProfileCtrl', (cfg, api, $scope, $cookieStore, $http, $timeout) ->
    console.log "Initializing profile controller"
    $scope.loading = false
    api.getCountries()
      .success (data) ->
        $scope.countries = data
    api.getEmployee($cookieStore.get 'user_id')
      .success (data) ->
        console.log data
        $scope.user = data
    api.getEmployments({'employee': ($cookieStore.get('user_id'))})
      .success (data) ->
        console.log data
        $scope.employments = data
        $scope.employments.forEach (o) ->
          o.imageUrl = "http://lorempixel.com/60/40/business/#{o.company}/"
          o.role = if o.is_manager then "Manager" else "Staff"
    #.success (data) ->
    #$scope.employments = data

    $scope.save = () ->
      $scope.saveStateInfo = "Saving"

      api.patchUser($scope.user.id, $scope.user)
        .success (data) ->
          # Add a 400 ms timeout so that the change from "Saving" to
          # "Changes saved" isn't a brief + ugly flicker.
          $timeout(
            () -> $scope.saveStateInfo = 'Changes saved',
            400) 
