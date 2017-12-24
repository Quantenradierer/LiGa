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

  def change_password
    params = password_params
    raise Exception.new('TODO') unless params[:password] == params[:password_confirmation]
    raise Exception.new('TODO') unless current_user.authenticate(params[:current_password])

    current_user.update!(password: params[:password])
    redirect_to current_user
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
