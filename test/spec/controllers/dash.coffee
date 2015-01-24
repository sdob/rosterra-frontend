'use strict'

describe 'Controller: DashCtrl', ->

  # load the controller's module
  beforeEach module 'rosterraApp'

  DashCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DashCtrl = $controller 'DashCtrl', {
      $scope: scope
    }
