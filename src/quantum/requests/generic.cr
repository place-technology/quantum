require "./base"

module Quantum
  module Requests
    class Generic < Base
      def version
        response = request read("/server/status/ping")
        get_in(response, ["Body", "PingResponse", "LEAPVersion"])
      end
    end
  end
end
