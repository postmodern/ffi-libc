require 'ffi/libc/types'

module FFI
  module LibC
    class Timeval < FFI::Struct

      layout :tv_sec, :time_t,
             :tv_usec, :suseconds_t

    end
  end
end
