'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:DashreportCtrl
 # @description
 # # DashreportCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'DashReportCtrl', (cfg, api, $scope, $http) ->
    now = moment()
    currentMonth = now.month()
    api.getRosterEntries({
      start: moment().startOf('month').format('YYYY-MM-DD')
      end: moment().endOf('month').format('YYYY-MM-DD')
    }).success (data) ->
      # Aggregate total shifts
      $scope.shifts = {}
      $scope.shifts[obj.activity.id] = ($scope.shifts[obj.activity.id] or 0) + 1 for obj in data
      # Aggregate total hours
      $scope.minutes = {}
      $scope.minutes[obj.activity.id] = ($scope.minutes[obj.activity.id] or 0) + 
        moment(obj.end).diff(obj.start, 'minutes') for obj in data
      $scope.employeeMinutes = {}
      $scope.employeeMinutes[obj.employee.id] = ($scope.employeeMinutes[obj.employee.id] or 0) +
        moment(obj.end).diff(obj.start, 'minutes') for obj in data
      $scope.employeeHourData = ({c: [{v: employee.name}, {v: $scope.employeeMinutes[employee.id] / 60}]} for employee in $scope.employees)
      # Create charts
      $scope.activityHourData = ({c: [{v: activity.name}, {v: $scope.minutes[activity.id] / 60}]} for activity in $scope.activities)
      $scope.hourBarChart = {
        type: "BarChart"
        data: {
          cols: [
            {id: 't', label: "Activity", type: 'string'}
            {id: 's', label: "Hours", type: 'number'}
          ]
          rows: $scope.activityHourData
        }
      }
      $scope.hourPieChart = {
        type: "PieChart"
        data: {
          cols: [
            {id: 't', label: "Activity", type: 'string'}
            {id: 's', label: "Hours", type: 'number'}
          ]
          rows: $scope.activityHourData
        }
      }
      $scope.employeePieChart = {
        type: 'PieChart'
        data: {
          cols: [
            {id: 't', label: 'Employee', type: 'string'}
            {id: 's', label: 'Hours', type: 'number'}
          ]
          rows: $scope.employeeHourData
        }
      }
      $scope.employeeBarChart = {
        type: 'BarChart'
        data: {
          cols: [
            {id: 't', label: 'Employee', type: 'string'}
            {id: 's', label: 'Hours', type: 'number'}
          ]
          rows: $scope.employeeHourData
        }
      }
