class EventsController < ApplicationController
  def index
    @all_events = Event.all
    @user = current_user
  end

  def new
  end

  def create
  end

  def show
    @event = Event.find(params[:id])
  end

end
