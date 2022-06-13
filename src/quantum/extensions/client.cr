module Halite
  class Client
    private def make_connection(request, options)
      conn = HTTP::Client.new(request.domain, options.tls)
      conn.tls.verify_mode = OpenSSL::SSL::VerifyMode::NONE
      conn.connect_timeout = options.timeout.connect.not_nil! if options.timeout.connect
      conn.read_timeout = options.timeout.read.not_nil! if options.timeout.read
      conn.write_timeout = options.timeout.write.not_nil! if options.timeout.write
      conn
    end
  end
end
