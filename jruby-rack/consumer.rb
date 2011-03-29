require 'common'
require 'ap'

Q = "queue/ExampleQueue"

JRuby::Rack::Queues::Registry.register_listener Q do |msg|
  raise
  ap msg
end

while true
  sleep 10
  puts "Sleeping..."
end