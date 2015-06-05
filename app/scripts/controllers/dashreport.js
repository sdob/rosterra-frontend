(function() {
  'use strict';

  /**
    * @ngdoc function
    * @name rosterraApp.controller:DashreportCtrl
    * @description
    * # DashReportCtrl
    * Controller of the rosterraApp
   */
  angular.module('rosterraApp').controller('DashReportCtrl', function(cfg, api, $scope) {
    // Call the API server for RosterEntries
    return api.getRosterEntries({
      start: moment().startOf('month').toISOString(),
      end: moment().endOf('month').toISOString()
    }).success(function (data) {
      // Iterate over returned data to aggregate it
      $scope.shifts = {};
      $scope.minutes = {};
      $scope.employeeMinutes = {};
      data.forEach (function (obj) {
        // Aggregate shifts per Activity
        $scope.shifts[obj.activity.id] = ($scope.shifts[obj.activity.id] || 0) + 1;
        var shiftLength = moment(obj.end).diff(obj.start, 'minutes');
        // Aggregate minutes per Activity
        $scope.minutes[obj.activity.id] = ($scope.minutes[obj.activity.id] || 0) + shiftLength;
        // Aggregate minutes per Employee
        $scope.employeeMinutes = ($scope.employeeMinutes[obj.employee.id] || 0) + shiftLength;
      });

      // Format employee data for Google Charts
      $scope.employeeHourData = $scope.employees.map(function (employee) {
        return {c: [{v: employee.name}, {v: $scope.employeeMinutes[employee.id] / 60}]};
      });
      // Format per-Activity data for Google Charts
      $scope.activityHourData = $scope.activities.map(function (activity) {
        return {c: [{v: activity.name}, {v: $scope.minutes[activity.id] / 60}]};
      });

      // Declare our chart formats
      $scope.hourBarChart = {
        type: "BarChart",
        data: {
          cols: [
            {
              id: 't',
              label: "Activity",
              type: 'string'
            }, {
              id: 's',
              label: "Hours",
              type: 'number'
            }
          ],
          rows: $scope.activityHourData
        }
      };
      $scope.hourPieChart = {
        type: "PieChart",
        data: {
          cols: [
            {
              id: 't',
              label: "Activity",
              type: 'string'
            }, {
              id: 's',
              label: "Hours",
              type: 'number'
            }
          ],
          rows: $scope.activityHourData
        }
      };
      $scope.employeePieChart = {
        type: 'PieChart',
        data: {
          cols: [
            {
              id: 't',
              label: 'Employee',
              type: 'string'
            }, {
              id: 's',
              label: 'Hours',
              type: 'number'
            }
          ],
          rows: $scope.employeeHourData
        }
      };
      $scope.employeeBarChart = {
        type: 'BarChart',
        data: {
          cols: [
            {
              id: 't',
              label: 'Employee',
              type: 'string'
            }, {
              id: 's',
              label: 'Hours',
              type: 'number'
            }
          ],
          rows: $scope.employeeHourData
        }
      };
    });
  });

}).call(this);
