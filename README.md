This guide will help you configure the SiriProxy plugin for controlling your Control4 system via the TCP Server driver.
Download: ( http://p5.hu/hu/termekek/reszletek/67_control4_tcp_driver/ )

Prerequisites:

You need to have a server running SiriProxy
You can find instruction about how to create it:
https://github.com/plamoni/Siriproxy



Configuration of SiriProxy

Copy the siriproxy-control4 folder to your ~/Siriproxy/plugins folder
Copy the following three lines from config-example.yml to your ~/.siriproxy/config.yml file.
ip_controller: must be set to the IP address of your Control4 controller.

- name: 'Control4'
  path: '~/Siriproxy/plugins/siriproxy-control4'
  ip_controller: 'IP address of C4 controller'
  
There are eight events (Event01..Event08) in the C4 Voice Control Server. You can assign actions in Composer programming to each of them. Whenever a voice command assigned to an event (see below) is received by Siri, the event will be fired causing these actions to be executed.

All voice commands that will be used to trigger Control4 events and the Siri response to them are defined in the command.yml file.   
  
  commands:  These are the voice commands that will trigger the event when received by Siri. More commands can trigger the same event.

  answer: This is what Siri will reply. Only one reply is allowed.
  
  
  Example of the commands.yml file:
  
  
  event01:

  commands:
  - Office light on 
  - Office lights on

  answer: Office light on


event02:

  commands:
  - Office light off
  - Office lights off

  answer: Office light off

event03:

  commands:
  - Garage door open
  - Door open
  
  answer: Garage door in motion
  
 

    

After defining all events you should execute:

    $ siriproxy bundle
    
    or
    
    $ rvmsudo siriproxy bundle



