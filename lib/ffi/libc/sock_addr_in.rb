require 'ffi/libc/types'
require 'ffi/libc/sock_addr_family'

module FFI
  module LibC
    #
    # sockaddr inet, always good to have around
    #
    class SockAddrIn < SockAddrFamily

      layout :len, :uint8,
             :family, :sa_family_t,
             :port, :in_port_t,
             :addr, :in_addr_t,
             :_sa_zero, [:uint8, 8]

    end
  end
end
