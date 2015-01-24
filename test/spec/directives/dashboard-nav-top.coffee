'use strict'

describe 'Directive: dashboardNavTop', ->

  # load the directive's module
  beforeEach module 'rosterraApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  #it 'should make hidden element visible', inject ($compile) ->
  #element = angular.element '<dashboard-nav-top></dashboard-nav-top>'
  #element = $compile(element) scope
  #expect(element.text()).toBe 'this is the dashboardNavTop directive'
