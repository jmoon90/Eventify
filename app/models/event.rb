class Event < ActiveRecord::Base

  def all_events
    seatgeek_api("events")
  end

  def event_id(id)
    seatgeek_api("events/#{id}")
  end

  private

  def seatgeek_api(resource)
    "http://api.seatgeek.com/2/#{resource}"
  end
end
