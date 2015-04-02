class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :layout_functions

def layout_functions
  if current_user
    @invites = Invite.where(invited: current_user.id, accepted: nil)
  end
  @users = User.all
end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation, :provider, :avatar, :game)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation, :provider, :avatar, :game)
    end
  end

  protect_from_forgery with: :exception
end
