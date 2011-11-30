require 'ffi/libc/types'
require 'ffi/libc/sockaddr_family'
require 'ffi/libc/in6_addr'

module FFI
  module LibC
    #
    # IPv6 socket address
    #
    class SockaddrIn6 < SockaddrFamily

      layout :len, :uint8,
             :family, :sa_family_t,
             :port, :in_port_t,
             :flowinfo, :uint32,
             :addr, In6Addr

    end
  end
end
