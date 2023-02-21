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
    @user = @event.admin
    @attendances = count_attendances
    @end_date = end_date?
  end


  def count_attendances
    @event = Event.find(params[:id])
    attendances_to_event = Attendance.where(event_id: @event.id)
    attendances_count = attendances_to_event.count
    return attendances_count
  end

  def end_date?
    @event = Event.find(params[:id])
    event_dur_sec = (@event.duration) * 60
    end_date = @event.start_date + event_dur_sec
    return end_date
  end

end
