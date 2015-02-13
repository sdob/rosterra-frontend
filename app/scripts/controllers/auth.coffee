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
      $cookieStore.remove 'user_id'
      $location.path '/'

    $scope.openModal = () ->
      console.log "opening authentication modal"
      modalInstance = $modal.open {
        templateUrl: 'views/partials/login.html'
        controller: 'ModalauthCtrl'
        backdropClass: 'dark'
        resolve: {
        }
      }
  ]
