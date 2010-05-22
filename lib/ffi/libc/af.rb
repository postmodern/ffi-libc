require 'socket'

module FFI
  module LibC
    #
    # Contains `AF_*` constants culled from Ruby's ::Socket
    #
    module AF
      APPLETALK = 5
      AX25 = 3
      INET = 2
      INET6 = 10
      IPX = 4
      ISDN = 34
      LOCAL = 1
      MAX = 36
      ROUTE = 16
      SNA = 22
      UNIX = 1
      UNSPEC = 0
    end
  end
end
