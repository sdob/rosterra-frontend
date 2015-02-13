'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'MainCtrl', ($scope, $cookieStore, $location) ->
    # If user is logged in then redirect to dashboard, otherwise keep the
    # splash template
    if $cookieStore.get 'token'
      $location.path '/dash'
