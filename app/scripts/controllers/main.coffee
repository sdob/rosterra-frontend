'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
