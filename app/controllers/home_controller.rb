class HomeController < ApplicationController
  SEATGEEK_BASE_URL = 'http://api.seatgeek.com/2/taxonomies'
  def index
    @month_of_the_year = month_of_the_year
    @states = states
    @attendee_count = attendee_count
    @event_type = event_type
  end

  private

  def month_of_the_year
    @month_of_the_year = [{name: 'Jan 2016', value: '2016-01'},
                          {name: 'Feb 2016', value: '2016-02'},
                          {name: 'Mar 2016', value: '2016-03'},
                          {name: 'Apr 2016', value: '2016-04'},
                          {name: 'May 2016', value: '2016-05'},
                          {name: 'Jun 2016', value: '2016-06'},
                          {name: 'Jul 2016', value: '2016-07'},
                          {name: 'Aug 2016', value: '2016-08'},
                          {name: 'Sep 2016', value: '2016-09'},
                          {name: 'Oct 2016', value: '2016-10'},
                          {name: 'Nov 2016', value: '2016-11'},
                          {name: 'Dec 2016', value: '2016-12'}]
  end

  def states
    # @state = [{:state_name=>"AL"}, {:state_name=>"MT"}, {:state_name=>"AK"}, {:state_name=>"NE"},
    #           {:state_name=>"AZ"}, {:state_name=>"NV"}, {:state_name=>"AR"}, {:state_name=>"NH"},
    #           {:state_name=>"CA"}, {:state_name=>"NJ"}, {:state_name=>"CO"}, {:state_name=>"NM"},
    #           {:state_name=>"CT"}, {:state_name=>"NY"}, {:state_name=>"DE"}, {:state_name=>"NC"},
    #           {:state_name=>"FL"}, {:state_name=>"ND"}, {:state_name=>"GA"}, {:state_name=>"OH"},
    #           {:state_name=>"HI"}, {:state_name=>"OK"}, {:state_name=>"ID"}, {:state_name=>"OR"},
    #           {:state_name=>"IL"}, {:state_name=>"PA"}, {:state_name=>"IN"}, {:state_name=>"RI"},
    #           {:state_name=>"IA"}, {:state_name=>"SC"}, {:state_name=>"KS"}, {:state_name=>"SD"},
    #           {:state_name=>"KY"}, {:state_name=>"TN"}, {:state_name=>"LA"}, {:state_name=>"TX"},
    #           {:state_name=>"ME"}, {:state_name=>"UT"}, {:state_name=>"MD"}, {:state_name=>"VT"},
    #           {:state_name=>"MA"}, {:state_name=>"VA"}, {:state_name=>"MI"}, {:state_name=>"WA"},
    #           {:state_name=>"MN"}, {:state_name=>"WV"}, {:state_name=>"MS"}, {:state_name=>"WI"},
    #           {:state_name=>"MO"}, {:state_name=>"WY"}].sort_by { |x| x[:state_name] }
    [{:state_name=>"NY"}, {:state_name=>"CA"}, {:state_name=>"PA"}, {:state_name=>"FL"}]
  end

  def attendee_count
    @attendee_count = [{attendee_count: 1},
                      {attendee_count: 2},
                      {attendee_count: 3},
                      {attendee_count: 4},
                      {attendee_count: 5},
                      {attendee_count: 6},
                      {attendee_count: 7},
                      {attendee_count: 8},
                      {attendee_count: 9},
                      {attendee_count: 10},
                      {attendee_count: 11},
                      {attendee_count: 12}]
  end

  def event_type
    @seat_geek_service = SeatGeekService.new(base_url: SEATGEEK_BASE_URL)
    @seat_geek_service.run['taxonomies']
  end

  private

#createa object that has event type + that event's image
#NBA - golden state vs lakers game image
  def build_event
    @seat_geek_service
  end
end
