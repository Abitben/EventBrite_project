class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @all_events = Event.all
    current_user
  end

  def new
    current_user
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_user.id
  
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end
  

  def show
    current_user
    @event = Event.find(params[:id])
    @user = @event.admin
    @attendances = count_attendances
    @end_date = end_date?
  end

  def count_attendances
    @event = Event.find(params[:id])
    attendances_to_event = Attendance.where(event_id: @event.id)
    attendances_to_event.count
  end

  def end_date?
    @event = Event.find(params[:id])
    event_dur_sec = @event.duration * 60
    @event.start_date + event_dur_sec
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end
end
