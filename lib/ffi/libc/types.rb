require 'ffi'

module FFI
  module LibC
    extend FFI::Library

    typedef :uint, :size_t
    typedef :int, :ssize_t
    typedef :uint, :off_t
    typedef :ulong, :time_t
    typedef :long, :suseconds_t
    typedef :pointer, :FILE
  end
end
