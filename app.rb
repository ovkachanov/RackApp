require 'rack'
require 'rack/response'
require_relative 'time_formatter'

class App
  def call(env)
    @request = Rack::Request.new(env)
    @timestring = TimeFormatter.new(@request.params['format'])
    logic
  end

  private

  def logic
    if @request.path != '/time'
      not_found
    elsif @timestring.valid_params?
      correct_answer(@timestring.formatted_time)
    else
      bad_request("Unknow time format: #{timestring.invalid_params}")
    end
  end

  def response(status:, headers: content_type, body: nil)
    [status, headers, ["#{body}\n"]]
  end

  def content_type
    { 'Content-Type' => 'text/plain' }
  end

  def not_found
    response(status: 404, body: "Not Found")
  end

  def correct_answer(body)
    response(status: 200, body: body)
  end

  def bad_request(body)
    response(status: 400, body: body)
  end
end
