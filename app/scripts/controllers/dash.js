(function() {
  'use strict';

  /**
   * @ngdoc function
   * @name rosterraApp.controller:DashCtrl
   * @description
   * # DashCtrl
   * Controller of the rosterraApp
   */

  angular.module('rosterraApp').controller('DashCtrl', function(cfg, api, authService, $scope, $rootScope, $http, localStorageService, $location, $modal) {

    ///////////////////////////////////////////////////////////////////////////
    // Scope function definitions
    ///////////////////////////////////////////////////////////////////////////

    // Open a modal with employee information
    $scope.openEmployeeModal = function (employee) {
      $modal.open({
        template: '<div>Hello ' + employee.name + '</div>',
        controller: function() {}
      });
    };

    // Switch between 'employee view' and 'company view'
    $scope.switchView = function() {
      if ($scope.currentView === 'employee') {
        $scope.setView('company');
      } else {
        $scope.setView('employee');
      }
    };

    // Change the current subset of data on view
    $scope.setView = function(which) {
      switch (which) {
        case 'reports':
          $scope.view = 'reports';
        break;
        default:
          $scope.view = 'overview';
        console.log('switching to overview');
      }
      localStorageService.set('chosenView', $scope.view);
    };

    // Change the current company and collapse the list of companies
    $scope.setCurrentCompanyAndCollapse = function (id) {
      $scope.setCurrentCompany(id);
      $scope.collapseCompanyList = true;
    };

    $scope.setCurrentCompany = function(id) {
      // console.log($scope.companies);
      // TODO: we're using indexOf here, which doesn't work on IE <= 8
      var index = $scope.companies.map(function (c) {return c.id;}).indexOf(id);
      console.log("$scope.companies is");
      console.log($scope.companies);
      console.log("setting current company to " + id);
      if (index > -1) { // company is in $scope.companies
        var newCompany = $scope.companies[index];
        // Re-order $scope.companies so that newCompany is at the head
        $scope.companies.splice(index, 1); // remove newCompany from $scope.companies
        $scope.companies.splice(0, 0, newCompany);
        $scope.currentCompany = newCompany;
        // Broadcast an event to child scopes
        console.log("broadcasting event: " + cfg.events.EVENT_COMPANY_CHANGE);
        $rootScope.$broadcast(cfg.events.EVENT_COMPANY_CHANGE, id);
      }
    };

    // Retrieve location, employee, and activity data for the current company
    // from the API server. This is three separate API calls.
    $scope.refreshSidebar = function() {
      console.log("refreshing sidebar");
      api.getLocations({company: $scope.currentCompany.id}).success(function(data) {
        $scope.locations = data;
      });
      api.getEmployees({company: $scope.currentCompany.id}).success(function(data) {
        $scope.employees = data;
      });
      return api.getActivities({company: $scope.currentCompany.id}).success(function(data) {
        $scope.activities = data;
      });
    };
    
    ///////////////////////////////////////////////////////////////////////////
    // Controller initialization
    ///////////////////////////////////////////////////////////////////////////

    
    // By default, unless we've stored a preference, the user starts
    // with the employee view of the company
    $scope.currentView = (localStorageService.get('currentView')) || 'employee';
    $scope.locations = [];
    $scope.employees = [];
    $scope.activities = [];
    
    // Initialize UI settings: all sidebar lists are collapsed
    $scope.collapseLocationList = true;
    $scope.collapseEmployeeList = true;
    $scope.collapseCompanyList = true;

    // Map Company IDs to a boolean determining whether we should allow the
    // user to switch between 'employee view' and 'company view'
    $scope.allowManagerialDisplay = {};

    // Set up authorization token. A well-behaved front-end should never try
    // to show the dashboard view if the user isn't logged in.
    if (authService.isLoggedIn()) {
      console.log("Setting Authorization token");
      $http.defaults.headers.common.Authorization = "Token " + localStorageService.get('token');
    }

    // Retrieve Employment objects from the API server and decide whether
    // to allow the user to make the view switch
    api.getEmployments({
      employee: localStorageService.get('user_id')
    }).success(function(data) {
      data.forEach(function (employment) {
        $scope.allowManagerialDisplay[employment.company] = employment.is_manager;
      });
    });


    // Retrieve the list of companies of which this user is an employee
    $scope.companies = [];
    api.getCompanies().success(function (data) {
      $scope.companies = data;
      console.log("currentCompanyID: " + (localStorageService.get('currentCompanyID')));
      if ($scope.companies.length > 0) {
        var currentCompanyID = (localStorageService.get('currentCompanyID')) || data[0].id;
        $scope.setCurrentCompany(currentCompanyID);
        var chosenView = (localStorageService.get('chosenView')) || 'overview';
        $scope.setView(chosenView);
      }
    });

    // Get the user's profile data
    $scope.user = {};
    api.getEmployee(localStorageService.get('user_id')).success(function(data) {
      $scope.user = data;
    });
  });

}).call(this);
