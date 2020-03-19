require 'socket'

Socket.tcp_server_loop(3000) do |connection|
    # never end util read all bytes sent from client
    puts connection.read
    connection.close
end
