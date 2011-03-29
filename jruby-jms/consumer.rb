require 'jms'
require 'yaml'
require 'ap'

# Load Connection parameters from configuration file
cfg = YAML.load_file(File.join(File.dirname(__FILE__), 'jms.yml'))
jms_provider = cfg['default']
config = cfg[jms_provider]

#JMS.logger = log4j
JMS.logger.level = ::Logger::DEBUG
JMS::Connection.start(config) do |connection|
  ap connection.meta_data

  #connection.on_exception do |jms_exception|
  #  ap jms_exception
  #end
  
  connection.on_message(:transacted => true, :queue_name => 'ExampleQueue', :statistics => true, :session_count => 10) do |message|
    ap message
    true #Must return true for the session to commit if it's transacted
  end
  
  while true
    sleep 10
    puts "Sleeping..."
    ap connection.on_message_statistics
  end
end


