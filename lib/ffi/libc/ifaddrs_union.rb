require 'ffi'

module FFI
  module LibC
    class IfaddrsUnion < FFI::Union

      layout :ifu_broadaddr, :pointer,
             :ifu_dstaddr,   :pointer

    end
  end
end
