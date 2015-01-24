'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:AuthctrlCtrl
 # @description
 # # AuthctrlCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'AuthCtrl', ['$scope', '$cookieStore', '$http', '$location', '$modal', ($scope, $cookieStore, $http, $location, $modal) ->


    $scope.isLoggedIn = () ->
      !!$cookieStore.get 'token'

    $scope.logout = () ->
      console.log "logging out"
      $cookieStore.remove 'token'
      $location.path '/'

    $scope.openModal = () ->
      console.log "sminky pinky"
      modalInstance = $modal.open {
        templateUrl: 'views/partials/login.html'
        controller: 'ModalauthCtrl'
        backdropClass: 'dark'
        resolve: {
        }
      }
      modalInstance.result.then (something) ->
        console.log 'kitchy koo'
        console.log something
  ]
