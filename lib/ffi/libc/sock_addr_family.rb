require 'ffi/libc/af'

module FFI
  module LibC
    #
    # Common abstract superclass for all sockaddr struct classes
    #
    class SockAddrFamily < ::FFI::Struct

    end
  end
end
