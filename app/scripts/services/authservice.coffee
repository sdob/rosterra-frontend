'use strict'

###*
 # @ngdoc service
 # @name rosterraApp.authService
 # @description
 # # authService
 # Factory in the rosterraApp.
###
angular.module('rosterraApp')
  .factory 'authService', ['cfg', '$cookieStore', '$http', '$location', (cfg, $cookieStore, $http, $location) ->
    {
      isLoggedIn: () ->
        isloggedin = !!($cookieStore.get('token') and $cookieStore.get('user_id'))
        "authService: isLoggedIn(): + " + isloggedin
        isloggedin

      login: (user_obj) ->
        console.log "authService: logging in"
        $http
          .post cfg.authUrl, user_obj
            .success (data, status, headers, config) ->
              console.log "token: '" + data.token + "'"
              console.log "user_id: " + data.user 
              # Add the token to our cookie store
              $cookieStore.put 'token', data.token
              $cookieStore.put 'user_id', data.user
              $http.defaults.headers.common.Authorization = "Token " + $cookieStore.get 'token'

      logout: () ->
        console.log "authService: removing token"
        $cookieStore.remove 'token' 
        $cookieStore.remove 'user_id' 
        delete $http.defaults.headers.common['Authorization']
        $location.path '/' # Redirect to home page
    }
  ]
