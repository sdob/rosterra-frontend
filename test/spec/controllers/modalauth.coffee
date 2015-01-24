'use strict'

describe 'Controller: ModalauthCtrl', ->

  # load the controller's module
  beforeEach module 'rosterraApp'

  ModalauthCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ModalauthCtrl = $controller 'ModalauthCtrl', {
      $scope: scope
    }
