'use strict';

describe('Directive: mainNavTop', function () {

  // load the directive's module
  beforeEach(module('directivesApp'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<main-nav-top></main-nav-top>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('this is the mainNavTop directive');
  }));
});
