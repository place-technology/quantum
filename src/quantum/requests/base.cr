module Quantum
  module Requests
    abstract class Base
      def initialize(@session : Session, @client_tag : String)
      end

      private def request(body)
        response = @session.post(raw: body.to_json)

        if response.status_code != 200
          Log.debug { response.body }
          raise Exception.new("The response returned with a status code of #{response.status_code}")
        end

        JSON.parse(response.body)
      end

      private def read(url : String)
        {
          "CommuniqueType" => "ReadRequest",
          "Header"         => {"ClientTag" => @client_tag, "Url" => url},
        }
      end

      private def update(url : String, body)
        {
          "CommuniqueType" => "UpdateRequest",
          "Header"         => {"ClientTag" => @client_tag, "Url" => url},
          "Body"           => body,
        }
      end

      private def get_in(json : JSON::Any, keys : Array(String))
        key = keys.first
        keys.delete(key)

        if keys.empty?
          json[key]
        else
          get_in(json[key], keys)
        end
      end
    end
  end
end
