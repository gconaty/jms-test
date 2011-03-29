require 'common'

Q = "queue/ExampleQueue"
NUM_MSGS = 1000

1.upto(NUM_MSGS) do
  msg = "hello-#{'%.02f' % rand}"
  ap "Pushing #{msg}"
  JRuby::Rack::Queues::Registry.publish_message Q, msg
end