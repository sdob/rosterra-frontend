'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
