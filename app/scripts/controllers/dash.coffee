'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:DashCtrl
 # @description
 # # DashCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'DashCtrl', (cfg, api, authService, $scope, $http, $cookieStore, $location, $modal, uiCalendarConfig) ->

    $scope.openEmployeeModal = (employee) -> 
      $modal.open {
        template: '<div>Hello!</div>'
        controller: ->
      }

    #$scope.showProfile = () ->
    #$location.path '/profile/'

    $scope.switchView = () ->
      if $scope.currentView == 'employee'
        $scope.setView 'company'
      else
        $scope.setView 'employee'

    $scope.setView = (which) ->
      switch which
        when 'reports' then (
          $scope.view = 'reports'
        )
        else (
          $scope.view = 'overview'
          console.log 'switching to overview'
        )
      $cookieStore.put 'chosenView', $scope.view

    # This wraps some application logic (setCurrentCompany) and some
    # presentation logic into a single expression that Angular can
    # evaluate as an ng-click attribute. It's not very elegant but
    # it works for now.
    $scope.setCurrentCompanyAndCollapse = (id) ->
      $scope.setCurrentCompany(id)
      $scope.collapseCompanyList = true

    # Change the current company and update the view
    $scope.setCurrentCompany = (id) ->
      console.log $scope.companies
      if id in c.id for c in $scope.companies # we've found a match
        console.log "putting " + id + " into cookieStore"
        $cookieStore.put('currentCompanyID', id)
        # TODO: This is a hacky way to re-order the list, but then I suck.
        newCompany = (c for c in $scope.companies when c.id == id)[0]
        $scope.companies = (c for c in $scope.companies when c.id != id)
        $scope.currentCompany = newCompany
        $scope.$broadcast('companyChange', id)
        $scope.companies.splice(0, 0, $scope.currentCompany)
        # Refresh the sidebar menu
        $scope.refreshSidebar()
        # Broadcast company change to child scopes (e.g., calendar controller)

    # Tell the authentication service to log us out, then redirect to the
    # home page
    #$scope.logout = () ->
    #authService.logout()
    #$location.path('/')

    # Retrieve location, employee, and activity data for the current company
    # from the API server
    $scope.refreshSidebar = ->
      console.log "refreshing sidebar"
      # Retrieve locations
      api.getLocations({company: $scope.currentCompany.id}).success (data) ->
        $scope.locations = data
      # Retrieve employee list
      api.getEmployees({company: $scope.currentCompany.id}).success (data) ->
        $scope.employees = data
      # Retrieve activity list
      api.getActivities({company: $scope.currentCompany.id}).success (data) ->
        $scope.activities = data

    ###########################################################################
    # Controller initialization
    ###########################################################################

    $scope.currentView = ($cookieStore.get 'currentView') or 'employee'
    # Displayable locations
    $scope.locations = []
    # Displayable employees
    $scope.employees = []
    # Displayable activities
    $scope.activities = []

    # User's employment status w.r.t. each company. This tells us whether we
    # should present the user with the option to switch between 'employee'
    # view and 'company' view. It doesn't elevate privileges (anybody who
    # tries to hack this manually will just get an ugly display with empty
    # lists).
    $scope.allowManagerialDisplay = {}
    # Retrieve Employment objects for the logged-in user
    api.getEmployments({employee: $cookieStore.get 'user_id'})
      .success (data) ->
        $scope.allowManagerialDisplay[c_obj['company']] = c_obj['is_manager'] for c_obj in data
    
    # Initialize GUI settings
    $scope.collapseLocationList = true
    $scope.collapseEmployeeList = true
    $scope.collapseCompanyList = true
    
    $scope.companies = []
    # Pull list of companies of which this user is an employee
    api.getCompanies()
      .success (data) ->
        $scope.companies = data
        console.log "currentCompanyID: " + ($cookieStore.get 'currentCompanyID')
        # If there are any companies
        if $scope.companies.length > 0
          currentCompanyID = ($cookieStore.get 'currentCompanyID') or data[0].id
          $scope.setCurrentCompany currentCompanyID
          # Retrieve last chosen view from cookie store or direct to overview
          chosenView = ($cookieStore.get 'chosenView') or 'overview'
          $scope.setView(chosenView)
    
    # Retrieve user profile data
    $scope.user = {}
    api.getEmployee($cookieStore.get 'user_id')
      .success (data) ->
        $scope.user = data

