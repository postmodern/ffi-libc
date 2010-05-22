require 'ffi/libc/types'
require 'ffi/libc/sock_addr_family'

module FFI
  module LibC
    #
    # The data-link socket address
    #
    class SockAddrDL < SockAddrFamily

      layout :len, :uint8,
             :family, :sa_family_t,
             :sdl_index, :uint16,
             :dltype, :uint8,
             :nlen, :uint8,
             :alen, :uint8,
             :slen, :uint8,
             :_data, :char

    end
  end
end
