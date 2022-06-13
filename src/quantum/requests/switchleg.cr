module Quantum
  module Requests
    class SwitchLeg < Base
      def get_by_id(id : Int32)
        response = request read("/switchleg/#{id}")
        get_in response, ["Body", "Area"]
      end

      def get_by_persistent_id(id : Int32)
        response = request read("/persistent/#{id}")
        get_in response, ["Body", "Area"]
      end

      def get_status(id : Int32)
        response = request read("/switchleg/#{id}/status")
        get_in response, ["Body", "Area"]
      end
    end
  end
end
