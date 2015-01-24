'use strict'

describe 'Directive: dashboardSidebar', ->

  # load the directive's module
  beforeEach module 'rosterraApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  #it 'should make hidden element visible', inject ($compile) ->
  #element = angular.element '<dashboard-sidebar></dashboard-sidebar>'
  #element = $compile(element) scope
  #expect(element.text()).toBe 'this is the dashboardSidebar directive'
