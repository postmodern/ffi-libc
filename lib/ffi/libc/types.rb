require 'ffi'

module FFI
  module LibC
    extend FFI::Library

    typedef :pointer, :FILE
  end
end
