require 'ffi/libc/types'
require 'ffi/libc/sockaddr_family'

module FFI
  module LibC
    #
    # sockaddr inet, always good to have around
    #
    class SockaddrIn < SockaddrFamily

      layout :len,      :uint8,
             :family,   :sa_family_t,
             :port,     :in_port_t,
             :addr,     :in_addr_t,
             :_sa_zero, [:uint8, 8]

    end
  end
end
