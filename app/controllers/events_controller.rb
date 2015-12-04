class EventsController < ApplicationController
  def index
    @events = events
  end

  private

  def events
    request = Typhoeus::Request.new("http://api.seatgeek.com/2/events",
      method: :get,
      headers: { Accept: "json" }
    ).run
    parsed_response = JSON.parse(request.body)
  end
end
