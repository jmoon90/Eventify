class SeatGeekService

  def initialize(base_url:, month_of_the_year: nil, state: nil, listing_count: nil, event_type: nil)
    @base_url = base_url
    @month_of_the_year = month_of_the_year
    @state = state
    @listing_count = listing_count
    @event_type = event_type
  end

  def run
    url = base_url + build_query
    request = Typhoeus::Request.new(url,
      method: :get,
      headers: { Accept: "json" }
    ).run
    parsed_response = JSON.parse(request.body)
  end

  private

  attr_accessor :month_of_the_year, :state, :listing_count, :event_type, :base_url

  def build_query
    query = ""
    if month_of_the_year
      query = month_query(month_of_the_year)
    end
    if state
      query = query + location_query(state)
    end
    if listing_count
      query = query + listing_count_query(listing_count)
    end
    if event_type
      query = query + event_type_query(event_type)
    end
    query
  end

  # Events in April 2012
  # $ curl 'http://api.seatgeek.com/2/events?datetime_utc.gte=2012-04-01&datetime_utc.lte=2012-04-30'
  def month_query(year_month)
    year, month = year_month.split('-')
    year = year.to_i
    month = month.to_i
    first_day_of_month = Date.civil(year, month, 1).strftime('%F')
    last_day_of_month = Date.civil(year, month, -1).strftime('%F')

    "?datetime_utc.gte=#{first_day_of_month}&datetime_utc.lte=#{last_day_of_month}"
  end

  # Events in NY state
  # $ curl 'http://api.seatgeek.com/2/events?venue.state=NY'
  def location_query(location)
    "&venue.state=#{location}"
  end

  # GET http://api.seatgeek.com/2/events?listing_count.gt=0
  def listing_count_query(count)
    "&listing_count.gt=#{count}"
  end

  # Sporting Events
  # $ curl 'http://api.seatgeek.com/2/events?taxonomies.name=sports'
  def event_type_query(type)
    "&taxonomies.name=#{type}"
  end
end
