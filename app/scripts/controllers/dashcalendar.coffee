'use strict'

###*
 # @ngdoc function
 # @name rosterraApp.controller:DashcalendarCtrl
 # @description
 # # DashcalendarCtrl
 # Controller of the rosterraApp
###
angular.module('rosterraApp')
  .controller 'DashCalendarCtrl', (cfg, $scope, $http, uiCalendarConfig) ->
    # Annoyingly, we have to put a $watch out since 'calendar' doesn't
    # exist until it's been loaded
    $scope.$watch('calendar', (n, o) ->
      if (n)
        console.log "doing a refetch"
        uiCalendarConfig.calendars.calendar.fullCalendar('refetchEvents')
    )

    $scope.eventEdit = (event, delta, revertFunc, jsEvent, ui, view) ->
      data = {
        'id': event.re_id
        'start': event.start.toISOString()
        'end': event.end.toISOString()
      }
      $http.patch cfg.apiUrl + '/roster-entries/' + event.re_id + '/', data

    $scope.setEventSourceUrl = (url) ->
      $scope.eventSourceUrl = url

    $scope.$on 'companyChange', (event, id) ->
      #$scope.eventSources.url = cfg.apiUrl + '/roster-entries/?company=' + id
      if uiCalendarConfig.calendars.calendar
        console.log "calling refetch"
        console.log "setting eventSourceUrl"
        $scope.setEventSourceUrl(cfg.apiUrl + '/roster-entries/?company=' + id)
        uiCalendarConfig.calendars.calendar.fullCalendar('refetchEvents')

    ###########################################################################
    # Initialize controller
    ###########################################################################

    $scope.setEventSourceUrl cfg.apiUrl + '/roster-entries/?company=' + $scope.currentCompany.id
    # read event sources from feed
    $scope.eventSources = []


    # Initialize calendar config
    $scope.uiConfig = {
      calendar: {
        defaultView: 'agendaWeek'
        timeFormat: 'H:mm'
        axisFormat: 'HH:mm'
        firstDay: 1
        titleFormat: "D MMM YYYY"
        columnFormat: "ddd D/M"
        header: {
          left: 'title'
          center: ''
          right: 'agendaDay agendaWeek prev,next'
        }
        slotEventOverlap: false
        editable: true
        # TODO: restrict droppable elements to employee items
        droppable: true
        eventRender: (event, element) ->
          element.append("<img src='http://lorempixel.com/24/24/people/" + event.employee + "/'>")
        eventResize: $scope.eventEdit
        eventDrop: $scope.eventEdit
        events: (s, e, t, c) ->
          console.log 'calling events function'
          console.log [s.toISOString(), e.toISOString()]
          console.log "eventSourceUrl: " + $scope.eventSourceUrl
          if $scope.eventSourceUrl
            $http.get $scope.eventSourceUrl, {params:
              {
                'start': s.toISOString(),
                'end': e.toISOString()
              }
            }
              .success (data) ->
                parsed = ({
                  start: o.start
                  end: o.end
                  title: o.activity.name
                  employee: o.employee.id
                  re_id: o.id
                } for o in data)
                c(parsed)
      }
    }
