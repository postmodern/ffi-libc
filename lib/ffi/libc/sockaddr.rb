require 'ffi/libc/types'
require 'ffi/libc/sockaddr_family'

module FFI
  module LibC
    #
    # The generic `sockaddr` structure.
    #
    class Sockaddr < SockaddrFamily

      layout :family, :sa_family_t,
             :data,   [:char, 14]

    end
  end
end
