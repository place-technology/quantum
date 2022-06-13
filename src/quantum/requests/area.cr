require "./base"

module Quantum
  module Requests
    class Area < Base
      def root
        response = request read("/area/rootarea")
        get_in response, ["Body", "Area"]
      end

      def get_by_id(id : Int32)
        response = request read("/area/#{id}")
        get_in response, ["Body", "Area"]
      end

      def get_by_persistent_id(id : Int32)
        response = request read("/persistent/#{id}")
        get_in response, ["Body", "Area"]
      end

      def get_status(id : Int32)
        response = request read("/area/#{id}/status")
        get_in response, ["Body", "Area"]
      end

      def get_zones(id : Int32)
        response = request read("/area/#{id}/zone")
        get_in response, ["Body", "Zones"]
      end

      def get_switchlegs(id : Int32)
        response = request read("/area/#{id}/switchleg")
        get_in response, ["Body", "SwitchLegs"]
      end
    end
  end
end
