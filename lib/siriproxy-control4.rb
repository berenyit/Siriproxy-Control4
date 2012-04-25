require "siriproxy-control4/version"
require "yaml"
require "siri_objects"
require "net/telnet"

class SiriProxy::Plugin::Control4 < SiriProxy::Plugin
    
    @@commands_def = YAML::load( File.open( File.expand_path( File.dirname( __FILE__ ) + "/../commands.yml" ) ) )

    @@commands_def.each_key do |key|
	listen_for /#{ @@commands_def[ key ][ "commands" ].join( "|" ) }/i do
	    send_command( key )
	    unless @@commands_def[ key ][ "answer" ].nil?
		say @@commands_def[ key ][ "answer" ]
	    end
	    request_completed
	end
    end
    
    def initialize( config )
    
	@ip_controller = config[ "ip_controller" ]
	if @ip_controller.nil?
	    raise "No ip address for controller.\nPlease set the ip_controller property in your config.yml!"
	end
	
    end

    def send_command( key )
	connection = Net::Telnet::new( "Host" => @ip_controller, "Port" => 8373, "Telnetmode" => false, "Timeout" => 5 )
	connection.print( key.upcase + "\r" )
	connection.close
    end
end
