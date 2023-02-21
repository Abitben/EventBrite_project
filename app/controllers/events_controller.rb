class EventsController < ApplicationController
  def index
    @all_events = Event.all
    @user = current_user
  end
end
