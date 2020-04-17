require_relative 'app.rb'

Rack::Handler::WEBrick.run App.new

# ----- Examples requests ------

  # oleg@oleg ~/T/r/rackapp> curl --url "http://localhost:8080/time?format=year%2Cmonth%2Cday" -i
  # HTTP/1.1 200 OK
  # Content-Type: text/plain
  # Server: WEBrick/1.3.1 (Ruby/2.4.3/2017-12-14)
  # Date: Fri, 17 Apr 2020 09:54:49 GMT
  # Content-Length: 9
  # Connection: Keep-Alive
  #
  # 2020-4-17⏎

  # oleg@oleg ~/T/r/rackapp> curl --url "http://localhost:8080/time?format=mount" -i
  # HTTP/1.1 400 Bad Request
  # Content-Type: text/plain
  # Server: WEBrick/1.3.1 (Ruby/2.4.3/2017-12-14)
  # Date: Fri, 17 Apr 2020 09:56:25 GMT
  # Content-Length: 29
  # Connection: Keep-Alive
  #
  # Unknown time format ["mount"]⏎

  # oleg@oleg ~/T/r/rackapp> curl --url "http://localhost:8080/time?format=year" -i
  # HTTP/1.1 200 OK
  # Content-Type: text/plain
  # Server: WEBrick/1.3.1 (Ruby/2.4.3/2017-12-14)
  # Date: Fri, 17 Apr 2020 09:56:34 GMT
  # Content-Length: 4
  # Connection: Keep-Alive
  #
  # 2020⏎                                                                                                                                                                                                         oleg@oleg ~/T/r/rackapp>
