'use strict'

describe 'Controller: DashNavCtrl', ->

  # load the controller's module
  beforeEach module 'rosterraApp'

  DashnavctrlCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DashNavCtrl = $controller 'DashNavCtrl', {
      $scope: scope
    }

  it 'should have proper unit tests', ->
