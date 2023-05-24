#Mock postmortem
##Issue summary
From 9:00 AM to 11:30AM EAT, flask serve to port 5000 resulted in 404 error response messages.
Local curl server that my application serve project web_flask/0-hello_route.py to serve its content from the route /airbnb-onepage/ on port 5000 returned errors or had reduced functionality.
The issue affected all application serve project of serving to the port infrastructure.
The root cause of this the port 5000 was served by datadog agent which is running on the port 5000 that causes port is in use by another program.

##Timeline (all East Africa Time)
At 9:00 AM: serving flask with python3
At 9:01 AM: The port is in use by another program
At 9:05 AM: My server is refused from connection
At 9:07 AM: Find solution for the on the google and slack trend
At 9:10 AM: stop the datadog agent from port 5000 and kill the process was success full
At 9:12 AM: Server restarts begin
At 9:30 AM: serving flask is running on the port 5000
##Root cause
At 2:00 PM EAT May 14, The datadog agent was installed on the ALX student server Which is the part of Alx project web monitoring and configured with server and nginx after configuration to serve web_flask/0-hello_route.py from the route /airbnb-onepage/ on port 5000 the datado agent was not stop or killed. This causes is not checked for the that moment. The causes the port is used another program specified an error 404 code for the local servers in serving it is content. This exposed a datadog agent running on the 5000 which caused them to flask serving for the application serve is used by another program while attempting to resolve the local serve for the services. In addition, the internal monitoring systems permanently blocked on this call to the authentication library. The combination of the bug and configuration error quickly caused all of the serving threads to be consumed. Traffic was permanently queued waiting for a serving thread to become available. The servers began repeatedly hanging and restarting as they attempted to recover and at 9:30 Am EAT, the service outage began.

##Resolution and recovery

At 9:30 AM EAT, by running debugging command the issue is investigated and quickly escalated the issue. By 9:31 AM, the incident response team identified that the monitoring system was exacerbating the problem caused by this datadog agent.

At 9:35 AM, we attempted to roll back the problematic configuration change. This rollback failed due to port 5000 is used by datadog agent to monitor the web activity. These problems were addressed and we successfully rolled back at 9:40 AM.

##Corrective and Preventative Measures
I have conducted an internal review and analysis of the port is used by another program. The following are actions we are taking to address the underlying causes of the issue and to help prevent recurrence and improve response times:
Kill the datadog agent or stop it from running with kill command which is the safer neasures.
Change rollback process to be quicker and more robust.
Fix the underlying authentication libraries and monitoring to correctly timeout/interrupt on errors.
Programmatically enforce staged rollouts of all configuration changes.
 

