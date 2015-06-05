(function() {
  'use strict';

  /**
   * @ngdoc function
   * @name rosterraApp.controller:DashcalendarCtrl
   * @description
   * # DashCalendarCtrl
   * Controller of the rosterraApp
   */
  angular.module('rosterraApp').controller('DashCalendarCtrl', function(api, cfg, $scope, $http, uiCalendarConfig) {

    ///////////////////////////////////////////////////////////////////////////
    // Function defs
    ///////////////////////////////////////////////////////////////////////////

    // Edit an event
    var eventEdit = function (event) {
      var start = moment(event.start).toISOString(),
        end = moment(event.end).toISOString();
      // Send a PATCH request to the API; the visible front-end change is
      // taken care of by fullCalendar so we don't need to update it
      api.patchRosterEntry(event.re_id, start, end).success(function () {
        // In theory, we could do something with the successfully-returned data
      });
    };

    // Retrieve events from the REST API
    var retrieveEvents = function(start, end, timezone, callback) {
        // Call the API for RosterEntries
        api.getRosterEntries({
          company: $scope.currentCompany.id,
          start: moment(start).toISOString(),
          end: moment(end).toISOString()
        }).success(function (data) {
          // Parse the returned data for fullCalendar
          var parsedData = data.map(function (o) {
            return {
              start: o.start,
              end: o.end,
              title: o.activity.name,
              employee: o.employee.id,
              re_id: o.id
            };
          });
          console.log("parsed " + parsedData.length + " events");
          callback(parsedData);
        });
    };

    var renderEvent = function(event, element) {
      console.log("calling eventRender");
      element.append("<img src='http://lorempixel.com/24/24/people/" + event.employee + "/'>");
    };

    $scope.setEventSourceUrl = function(url) {
      $scope.eventSourceUrl = url;
    };

    ///////////////////////////////////////////////////////////////////////////
    // Event listeners
    ///////////////////////////////////////////////////////////////////////////

    $scope.$on(cfg.events.EVENT_COMPANY_CHANGE, function(event, id) {
      if (uiCalendarConfig.calendars.calendar) {
        uiCalendarConfig.calendars.calendar.fullCalendar('refetchEvents');
      }
    });

    ///////////////////////////////////////////////////////////////////////////
    // Initialization
    ///////////////////////////////////////////////////////////////////////////

    // We have to $watch the scope 'calendar' property, since it doesn't
    // exist until it's been loaded. This is an annoying hack.
    $scope.$watch('calendar', function(n) {
      if (n) {
        // Refetch events
        uiCalendarConfig.calendars.calendar.fullCalendar('refetchEvents');
      }
    });

    // We never use this directly, but the calendar configuration
    // requires it
    $scope.eventSources = [];

    // Configure the calendar. Mostly formatting, but we also set the
    // event-change functions
    $scope.uiConfig = {
      calendar: {
        defaultView: 'agendaWeek',
        timeFormat: 'H:mm',
        axisFormat: 'HH:mm',
        firstDay: 1,
        titleFormat: "D MMM YYYY",
        columnFormat: "ddd D/M",
        header: {
          left: 'title',
          center: '',
          right: 'agendaDay agendaWeek prev,next'
        },
        editable: true,
        droppable: true,
        eventRender: renderEvent,
        eventResize: eventEdit,
        eventDrop: eventEdit,
        events: retrieveEvents // use a function as an event source
      }
    };
  });
}).call(this);
