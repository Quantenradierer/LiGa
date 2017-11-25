require_relative '../helpers/users_helper'

class UsersController < ApplicationController
  include GamesHelper

  def new
    @user = User.new
  end

  def index
    @users = User.all
    authorize @users
  end

  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
