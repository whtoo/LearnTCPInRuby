require 'socket'

module CloundHash
    class Server
        def initialize(port)
            # 创建底层服务器套接字
            @server = TCPServer.new(port)
            puts "Listening on port #{@server.local_address.ip_port}"
            @storage = {}
        end

        def start
            #accept 循环
            Socket.accept_loop(@server) do |connection|
                handle(connection)
                connection.close
            end
        end

        def handle(connection)
            # 从连接中进行读取, 之道出现EOF
            request = connection.read

            connection.write process(request)
        end

        def process(request)
            command, key,value = request.split
            case command.upcase
            when 'GET'
                @storage[key]

            when 'SET'
                @storage[key] = value
            end
        end
    end
end

server = CloundHash::Server.new(3000)
server.start