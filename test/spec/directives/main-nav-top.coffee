'use strict'

describe 'Directive: mainNavTop', ->

  # load the directive's module
  beforeEach module 'rosterraApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  #it 'should make hidden element visible', inject ($compile) ->
  #element = angular.element '<main-nav-top></main-nav-top>'
  #element = $compile(element) scope
  #expect(element.text()).toBe 'this is the mainNavTop directive'
