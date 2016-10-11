class UsersController < ApplicationController
  before_action :authorize_user,except:[:show]

  def index
    @admins = []
    @non_admins = []
    @users = User.all
    @users.each do |user|
      if user.admin?
        @admins << user
      else
        @non_admins << user
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
      if @user.admin?
        flash[:error] = "You do not have the authority to complete this action"
      elsif @user.destroy
        flash[:success] = "User deleted, we didn't like them anyway."
      else
        flash[:errors] = @user.errors
      end
   redirect_to users_path
  end

private

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Where ya goin?!@")
    end
  end
end
