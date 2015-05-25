'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:DashnavctrlCtrl
 # @description
 # # DashnavctrlCtrl
 # Controller of the rosterraApp
###
angular.module 'rosterraApp'
  .controller 'DashNavCtrl', ($scope, dashNav, authService) ->
    $scope.logout = authService.logout
    $scope.showProfile = dashNav.showProfile
    $scope.showDash = dashNav.showDash
