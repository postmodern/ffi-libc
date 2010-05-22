module FFI
  module LibC
    #
    # Used to represent an IPv6 address in a `sock_addr_in6` structure
    #
    class In6Addr < ::FFI::Struct

      layout :s6_addr, [:uint8, 16]

    end
  end
end
