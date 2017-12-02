require 'pty'

module GamesHelper
  def create_server_name
    'server-' + [*('a'..'z'), *('0'..'9')].sample(6).join
  end
end