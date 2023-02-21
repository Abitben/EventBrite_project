class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, :only => [:show]


  def show
    before_action :is_current_user?
    @user = User.find(params[:id])
    @user_events = Event.where(admin_id: @user.id)
  end
end
