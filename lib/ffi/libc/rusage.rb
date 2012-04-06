require 'ffi/libc/types'
require 'ffi/libc/timeval'

module FFI
  module LibC
    class RUsage < FFI::Struct
      layout :ru_utime, Timeval,
             :ru_stime, Timeval,
             :ru_maxrss, :long,
             :ru_ixrss, :long,
             :ru_idrss, :long,
             :ru_isrss, :long,
             :ru_minflt, :long,
             :ru_majflt, :long,
             :ru_nswap, :long,
             :ru_inblock, :long,
             :ru_oublock, :long,
             :ru_msgsnd, :long,
             :ru_msgrcv, :long,
             :ru_nsignals, :long,
             :ru_nvcsw, :long,
             :ru_nivcsw, :long,
    end
  end
end
