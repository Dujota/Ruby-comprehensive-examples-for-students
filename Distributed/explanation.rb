puts <<-Exp
=== Distributed Ruby ===
  A drb application has two basic components-- a server and a client.
  -Server has the following responsibilities
    - Starts a TCPServer and listens on port.
    - Binds an object to the drb server instance
    - Accepts connections from clients and responds to their messages.
    - May optionally provide access control(security).
  -Cleint has the followings.
    - Establishes a connection to the server process.
    - Binds a local object to the remote server object.
    - Sends messages to the server object and gets responses.

Exp


