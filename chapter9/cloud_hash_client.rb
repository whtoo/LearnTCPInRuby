require 'socket'

module CloundHash
    class Client
        class << self
            attr_accessor :host, :port
        end

        def self.get(key)
            request "GET #{key}"
        end

        def self.set(key,value)
            request "SET #{key} #{value}"
        end

        def self.request(string)
            @client = TCPSocket.new(host,port)
            @client.write(string)

            @client.close_write
            @client.read
        end
    end
end

CloundHash::Client.host = '127.0.0.1'
CloundHash::Client.port = 3000

puts CloundHash::Client.set 'prez', 'obama'
puts CloundHash::Client.get 'prev'
putc CloundHash::Client.get 'vp'