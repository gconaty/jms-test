require 'jruby-rack'
require 'ap'

require '../hornetq-core-client'
require '../hornetq-jms-client'
require '../jboss-jms-api'
require '../jnp-client'
require '../netty'

require 'jruby/rack/queues/local'

JRuby::Rack::Queues::LocalContext.init_parameters["jms.jndi.properties"] = <<-JNDI
java.naming.factory.initial=org.jnp.interfaces.NamingContextFactory
java.naming.provider.url=jnp://localhost:1099
java.naming.factory.url.pkgs=org.jboss.naming:org.jnp.interfaces
java.naming.security.principal: guest
java.naming.security.credentials: guest
JNDI

JRuby::Rack::Queues::Registry.start_queue_manager
at_exit do
  JRuby::Rack::Queues::Registry.stop_queue_manager
end