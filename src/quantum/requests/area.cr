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
        get_in response, ["Body", "AreaStatus"]
      end

      def get_zones(id : Int32)
        response = request read("/area/#{id}/zone")
        get_in response, ["Body", "Zones"]
      end

      def get_switchlegs(id : Int32)
        response = request read("/area/#{id}/switchleg")
        get_in response, ["Body", "SwitchLegs"]
      end

      def get_scenes(id : Int32)
        response = request read("/area/#{id}")
        get_in response, ["Body", "Area", "Scene"]
      end

      def get_occupancy_status(id : Int32)
        response = request read("/area/#{id}/status")
        area_status = get_in response, ["Body", "AreaStatus"]
        is_leaf = get_in area_status, ["Area", "IsLeaf"]

        is_leaf.as_bool ? get_in area_status, ["OccupancyStatus"] : "Unknown"
      end

      def set_scene(id : Int32, scene : Int32)
        response = request update("/area/#{id}/status", {"AreaStatus" => {"CurrentScene" => scene}})
        get_in response, ["Body", "AreaStatus"]
      end
    end
  end
end
