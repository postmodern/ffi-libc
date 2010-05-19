require 'ffi'

module FFI
  module LibC
    extend FFI::Library

    typedef :uint, :size_t
    typedef :int, :ssize_t
    typedef :uint, :off_t
    typedef :pointer, :FILE
  end
end
