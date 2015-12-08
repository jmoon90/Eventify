class HomeController < ApplicationController
  SEATGEEK_BASE_URL = 'http://api.seatgeek.com/2/taxonomies'
  def index
    @month_of_the_year = month_of_the_year
    @number_of_tickets = number_of_tickets
    @state = state
    @listing_count = listing_count
    @event_type = event_type
  end

  private

  def number_of_tickets
    [[1],[2],[3]]
  end

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

  def state
    @state = [{:state_name=>"AL"}, {:state_name=>"MT"}, {:state_name=>"AK"}, {:state_name=>"NE"},
              {:state_name=>"AZ"}, {:state_name=>"NV"}, {:state_name=>"AR"}, {:state_name=>"NH"},
              {:state_name=>"CA"}, {:state_name=>"NJ"}, {:state_name=>"CO"}, {:state_name=>"NM"},
              {:state_name=>"CT"}, {:state_name=>"NY"}, {:state_name=>"DE"}, {:state_name=>"NC"},
              {:state_name=>"FL"}, {:state_name=>"ND"}, {:state_name=>"GA"}, {:state_name=>"OH"},
              {:state_name=>"HI"}, {:state_name=>"OK"}, {:state_name=>"ID"}, {:state_name=>"OR"},
              {:state_name=>"IL"}, {:state_name=>"PA"}, {:state_name=>"IN"}, {:state_name=>"RI"},
              {:state_name=>"IA"}, {:state_name=>"SC"}, {:state_name=>"KS"}, {:state_name=>"SD"},
              {:state_name=>"KY"}, {:state_name=>"TN"}, {:state_name=>"LA"}, {:state_name=>"TX"},
              {:state_name=>"ME"}, {:state_name=>"UT"}, {:state_name=>"MD"}, {:state_name=>"VT"},
              {:state_name=>"MA"}, {:state_name=>"VA"}, {:state_name=>"MI"}, {:state_name=>"WA"},
              {:state_name=>"MN"}, {:state_name=>"WV"}, {:state_name=>"MS"}, {:state_name=>"WI"},
              {:state_name=>"MO"}, {:state_name=>"WY"}].sort_by { |x| x[:state_name] }
  end

  def listing_count
    @listing_count = [{listing_count: 1},
                      {listing_count: 2},
                      {listing_count: 3},
                      {listing_count: 4},
                      {listing_count: 5},
                      {listing_count: 6},
                      {listing_count: 7},
                      {listing_count: 8},
                      {listing_count: 9},
                      {listing_count: 10},
                      {listing_count: 11},
                      {listing_count: 12}]
  end

  def event_type
    @seat_geek_service = SeatGeekService.new(base_url: SEATGEEK_BASE_URL)
    @seat_geek_service.run['taxonomies']
  end
end
