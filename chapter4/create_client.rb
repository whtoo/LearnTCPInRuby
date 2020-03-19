require 'socket'

socket = Socket.new(:INET,:STREAM)

#发起到 0.0.0.0端口3000的连接
# Socket.tcp('0.0.0.0',3000) do |connection|
#     connection.write"GET / HTTP/1.1\r\n"
#     connection.close
# end

remote_addr = Socket.pack_sockaddr_in(3000,'0.0.0.0')
socket.connect(remote_addr)
socket.write"GET / HTTP/1.1\r\n"
socket.close