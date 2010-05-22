require 'ffi/libc/types'

module FFI
  module LibC
    #
    # Used to represent a 32-bit IPv4 address in a `sock_addr_in` structure
    # 
    class InAddr < ::FFI::Struct

      layout :in_addr, :in_addr_t

    end
  end
end
