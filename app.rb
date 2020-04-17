require 'rack'
require 'rack/response'

class App
  def call(env)
    date = DateTime.now
    @formats_time = { 'year' => date.year, 'month' => date.month, 'day' => date.day, 'hour' => date.hour,
                      'minute' => date.minute, 'second' => date.second }
    @request = Rack::Request.new(env)
    logic
  end

  private

  def params_split
    @request.params['format'].split(',')
  end

  def valid_params
    params_split.map { |format| @formats_time[format] }.compact.join('-')
  end

  def invalid_params
    params_split.reject { |format| @formats_time[format] }
  end

  def logic
    if @request.path != '/time'
      [404, { 'Content-Type' => 'text/plain' }, ["Error request!"]]
    elsif params_split.all? { |format| @formats_time.key?(format) }
      [200, { 'Content-Type' => 'text/plain' }, [valid_params]]
    else
      [400, { 'Content-Type' => 'text/plain' }, ["Unknown time format #{invalid_params}"]]
    end
  end
end
