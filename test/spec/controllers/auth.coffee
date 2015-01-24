'use strict'

describe 'Controller: AuthCtrl', ->

  # load the controller's module
  beforeEach module 'rosterraApp'

  AuthctrlCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AuthctrlCtrl = $controller 'AuthCtrl', {
      $scope: scope
    }
