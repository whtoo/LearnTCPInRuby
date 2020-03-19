require 'socket'

#创建一个新的TCP套接字
server = Socket.new(Socket::AF_INET,Socket::SOCK_STREAM)
#创建一个C结构体用来保存用于侦听的地址
addr = Socket.pack_sockaddr_in(3000,'0.0.0.0')
#绑定监听端口
server.bind(addr)
#告诉套接字能够侦听接入的最大连接数
#在mac上是默认是128
#可以通过运行时通过Socket::SOMAXCONN在查看
server.listen(128)

#接受连接
connection, _ = server.accept

puts "最大连接数:#{Socket::SOMAXCONN}"
puts 'Server has launched...'
puts 'Wait for request'


print 'Server fileno:'
p server.fileno

print 'File fileno:'
p connection.fileno

print 'Local address: '
p connection.local_address

print 'Remote address: '
p connection.remote_address

####################
#   Print info     #
####################
# 最大连接数 : 128
# Server has launched...
# Wait for request
# Local address: #<Addrinfo: 127.0.0.1:3000 TCP>
# Remote address: #<Addrinfo: 127.0.0.1:49520 TCP>