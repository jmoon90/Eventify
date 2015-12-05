class EventsController < ApplicationController
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
    seat_geek_service.run
  end

  def seat_geek_service
    @seat_geek_service = SeatGeekService.new(base_url: 'http://api.seatgeek.com/2/events',
                                             month_of_the_year: params['month_of_the_year'],
                                             state: params['state'],
                                             listing_count: params['listing_count'],
                                             event_type: params['event_type'])
  end
end
