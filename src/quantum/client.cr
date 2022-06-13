module Quantum
  class Client
    property session : Session

    getter area : Requests::Area
    getter generic : Requests::Generic
    getter switch_leg : Requests::SwitchLeg
    getter zone : Requests::Zone

    def initialize(host_name : String, api_key : String, device_key : String)
      @session = Session.new(host_name, api_key, device_key)

      @area = Requests::Area.new(@session, Constants::CLIENT_TAG)
      @generic = Requests::Generic.new(@session, Constants::CLIENT_TAG)
      @switch_leg = Requests::SwitchLeg.new(@session, Constants::CLIENT_TAG)
      @zone = Requests::Zone.new(@session, Constants::CLIENT_TAG)
    end
  end
end
