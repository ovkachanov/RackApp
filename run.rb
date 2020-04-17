require_relative 'app.rb'

Rack::Handler::WEBrick.run App.new
