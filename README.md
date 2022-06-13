# Quantum API

A wrapper for the Quantum Lutron Extensible Application Protocol (LEAP) API

# Installation

```yaml
dependencies:
  quantum:
    github: place-technology/quantum
```

Add this to your `shard.yml` file

# Usage

```crystal
require "quantum"

# Create a connection with the API.
client = Quantum::Client.new(host_name: "demo.lutron.org", api_key: "ABCDEFGHIJKLMNOPQRSTUVWXYZ", device_key: "ab22c585-14e6-4c6b-b418-166728bcc608")

# Use the API to retrieve the zones.
client.area.get_zones(id: 1228).as_a.each do |zone|
  puts zone
end
```