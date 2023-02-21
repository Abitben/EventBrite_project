module UsersHelper

  def is_current_user?
    @user = User.find(params[:id])
    if current_user.id == @user.id
      return true
    end
  end

end