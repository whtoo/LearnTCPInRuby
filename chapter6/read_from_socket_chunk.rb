require 'socket'
one_kb = 1024 * 4 # 字节数
Socket.tcp_server_loop(3000) do |connection|
    begin
        # never end util read all bytes sent from client
        while data = connection.readpartial(one_kb) do
            puts data
        end
        rescue EOFError
    end
    connection.close
end
