module Quantum
  module Requests
    class Zone < Base
      def get_by_id(id : Int32)
        response = request read("/zone/#{id}")
        get_in(response, ["Body", "Zone"])
      end

      def get_by_persistent_id(id : Int32)
        response = request read("/persistent/#{id}")
        get_in(response, ["Body", "Zone"])
      end

      def get_status(id : Int32)
        response = request read("/zone/#{id}/status")
        get_in(response, ["Body", "ZoneStatus"])
      end

      def set_status_level(id : Int32, level : String)
        response = request update("/zone/#{id}/status", {"ZoneStatus" => {"Level" => level}})
        get_in(response, ["Body", "ZoneStatus"])
      end
    end
  end
end
