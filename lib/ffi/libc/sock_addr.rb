require 'ffi/libc/types'
require 'ffi/libc/sock_addr_family'

module FFI
  module LibC
    #
    # The generic `sock_addr` structure.
    #
    class SockAddr < SockAddrFamily

      layout :len, :uint8,
             :family, :sa_family_t,
             :data, :char

    end
  end
end
