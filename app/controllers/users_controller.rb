class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!


  def show
    if is_current_user?
      @user = User.find(params[:id])
      @user_events = Event.where(admin_id: @user.id)
    else
      redirect_to events_path
    end
  end
end
