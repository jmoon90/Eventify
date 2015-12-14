(function() {
  function init() {
    bindEvents();
    var eventTypeValue = '';
    var attendeeValue = '';
    var monthYearValue = '';
    var statesValue = '';
  }

  function bindEvents() {
    eventTypePartial();
    attendeePartial();
    monthYearPartial();
    statesPartial();
  }

  function eventTypePartial() {
    var eventType = document.getElementById('listOfEventTypes').children;

    for (var i = 0; i < eventType.length; i++) (function(n){
      eventType[n].addEventListener('click', function() {
        eventTypeValue = eventType[n].dataset.eventType;
        document.getElementById('eventTypePartial').style.display = 'none';
        document.getElementById('attendeePartial').style.display = 'block';
      }, false);
    })(i);
  }

  function attendeePartial() {
    var attendeeCount = document.getElementById('attendeeCount').children;

    for (var i = 0; i < attendeeCount.length; i++) (function(n){
      attendeeCount[n].addEventListener('click', function() {
        attendeeValue = attendeeCount[n].dataset.eventType;
        document.getElementById('eventMonthYearPartial').style.display = 'block';
        document.getElementById('attendeePartial').style.display = 'none';
      }, false);
    })(i);
  }

  function monthYearPartial() {
    var listOfMonthyear = document.getElementById('listOfMonthYear').children;

    for (var i = 0; i < listOfMonthyear.length; i++) (function(n){
      listOfMonthyear[n].addEventListener('click', function() {
        monthYearValue = listOfMonthyear[n].dataset.eventType;
        document.getElementById('statesPartial').style.display = 'block';
        document.getElementById('eventMonthYearPartial').style.display = 'none';
      }, false);
    })(i);
  }

  function statesPartial() {
    var listOfStates = document.getElementById('listOfStates').children;

    for (var i = 0; i < listOfStates.length; i++) (function(n){
      listOfStates[n].addEventListener('click', function() {
        statesValue = listOfStates[n].dataset.eventType;
        document.getElementById('statesPartial').style.display = 'none';
        submitValuesToSeatGeek();
      }, false);
    })(i);
  }

  function submitValuesToSeatGeek() {
    window.location.href = '/events?' +  'month_of_the_year=' + monthYearValue + '&state=' + statesValue + '&attendee_count=' + attendeeValue + '&event_type=' + eventTypeValue;
  }

  $(document).ready(function() {
    init();
  });

})(jQuery);
