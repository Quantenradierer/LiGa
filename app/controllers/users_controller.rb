require_relative '../helpers/users_helper'

class UsersController < ApplicationController
  include GamesHelper

  before_action { authenticate! }

  def new
    @user = authorize User.new
  end

  def index
    @users = policy_scope(User)
  end

  def create
    @user = authorize User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = authorize User.find(params[:id])
    @games = policy_scope(Game)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
