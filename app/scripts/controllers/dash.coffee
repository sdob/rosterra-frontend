'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:DashCtrl
 # @description
 # # DashCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'DashCtrl', ($scope, $http) ->
    console.log "dash control"
    # Control what happens on the main page when the top nav
    # stuff is clicked
    pageFuncs = {
      'dash': () ->
        $scope.currentPageName="Dashboard"
        $http.get('http://localhost:8000/locations')
          .success (data, status, headers, config) ->
            $scope.locations = data
      'profile': () ->
        $scope.currentPageName="Profile"
      'help': () ->
        $scope.currentPageName="Help"
      'settings': () ->
        $scope.currentPageName="Settings"
    }
    $scope.setPage = (view) ->
      switch view
        when 'settings' then pageFuncs['settings']($scope)
        when 'profile' then pageFuncs['profile']($scope)
        when 'help' then pageFuncs['help']($scope)
        else pageFuncs['dash']()
    $scope.setPage('dash')
