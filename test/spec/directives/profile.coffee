'use strict'

describe 'Directive: profile', ->

  # load the directive's module
  beforeEach module 'rosterraApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<profile></profile>'
    element = $compile(element) scope
