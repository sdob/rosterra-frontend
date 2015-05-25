'use strict'

describe 'Service: dashNav', ->

  # load the service's module
  beforeEach module 'rosterraApp'

  # instantiate service
  dashNav = {}
  beforeEach inject (_dashNav_) ->
    dashNav = _dashNav_

  it 'should do something', ->
    expect(!!dashNav).toBe true
