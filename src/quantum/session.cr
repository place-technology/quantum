module Quantum
  class Session
    property host_name : String
    property api_key : String
    property device_key : String

    getter url : String
    getter client : Halite::Client = Halite::Client.new

    def initialize(@host_name : String, @api_key : String, @device_key : String)
      @url = ["https://", @host_name, "/api/v1/leap"].join

      @client.headers({"Authorization" => @device_key})
      @client.headers({"ApiKey" => @api_key})
      @client.headers({"Content-Type" => "application/json; charset=utf-8"})

      @client.timeout Constants::DEFAULT_SINGLE_REQUEST_TIMEOUT
    end

    private def request(method : String, **kwargs) : Halite::Response
      case method
      when "POST"
        @client.post @url, **kwargs
      else
        raise Exception.new("Incorrect request method was supplied to the request function.")
      end
    end

    def post(**kwargs) : Halite::Response
      # Sends a GET request.
      request("POST", **kwargs)
    end
  end
end
