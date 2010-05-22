require 'ffi'

module FFI
  module LibC
    extend FFI::Library

    typedef :pointer, :FILE
    typedef :uint32, :in_addr_t
    typedef :uint16, :in_port_t
  end
end
