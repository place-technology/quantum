module Quantum
  module Constants
    CLIENT_TAG                     = UUID.random.to_s
    DEFAULT_SINGLE_REQUEST_TIMEOUT = 60_000
  end
end
