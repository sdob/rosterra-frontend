'use strict'

###*
 # @ngdoc service
 # @name rosterraApp.dashNav
 # @description
 # # dashNav
 # Factory in the rosterraApp.
###
angular.module 'rosterraApp'
  .factory 'dashNav', (authService, api, $location) ->
    console.log "dashNav initializing"

    # Tell the authentication service to log us out, then redirect to the
    # home page
    logout: ->
      authService.logout()
      #$location.path('/')
    showProfile: ->
      $location.path('/profile')
    showDash: ->
      $location.path('/dash')
