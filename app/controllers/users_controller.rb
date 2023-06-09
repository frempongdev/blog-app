class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out_and_redirect
    else
      @user = User.find(params[:id])
    end
  end

  private

  def sign_out_and_redirect
    sign_out current_user
    redirect_to new_user_session_path
  end
end
