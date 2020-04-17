class TimeFormatter

  TIME_FORMATS = {
    'year'   => '%Y',
    'month'  => '%m',
    'day'    => '%d',
    'hour'   => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(params)
    @time_params = params.split(',')
  end

  def valid_params?
    invalid_params.empty?
  end

  def invalid_params
    @time_params.reject { |t| TIME_FORMATS.include?(t) }
  end

  def formatted_time
    Time.now.strftime(format_string)
  end

  private

  def format_string
    @time_params.map { |t| TIME_FORMATS[t] }.join('-')
  end
end
