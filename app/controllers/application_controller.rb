require 'exceptions'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action { I18n.locale = :de }
  rescue_from NotAuthenticatedException do
    redirect_to :sessions_new
  end

  include Pundit
  include SessionsHelper
  include CommonHelper
end
