class EventsController < ApplicationController
  SEATGEEK_BASE_URL = 'http://api.seatgeek.com/2/events'
  def index
    events = events_list

    @events_in_groups = []
    events["events"].in_groups_of(3) { |group| @events_in_groups << group.compact }
    @events_in_groups
  end

  def show
    @event = event
  end

  private

  def events_list
     SeatGeek.get_events(month_of_the_year: params['month_of_the_year'],
                         state: params['state'],
                         attendee_count: params['attendee_count'],
                         event_type: params['event_type'],
                         seat_geek_partner_id: ENV["SEAT_GEEK_PARTNER_ID"])
  end
end
