class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to dashboard_index_url
    else
      # Create an error message.
      unless user.nil?
        user.errors.each do |error|
          put error
        end
      end
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to dashboard_index_url
  end
end
