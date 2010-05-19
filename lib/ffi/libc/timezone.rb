require 'ffi'

module FFI
  module LibC
    class Timezone < FFI::Struct

      layout :tz_minutewest, :int,
             :tz_dsttime, :int

    end
  end
end
