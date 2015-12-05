class EventsController < ApplicationController
  def index
    @events = events_list
  end

  def show
    @event = event
  end

  private

  def events_list
    request = Typhoeus::Request.new("http://api.seatgeek.com/2/events",
      method: :get,
      headers: { Accept: "json" }
    ).run
    parsed_response = JSON.parse(request.body)
  end
end
