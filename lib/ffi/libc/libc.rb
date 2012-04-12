require 'ffi/libc/types'
require 'ffi/libc/timeval'
require 'ffi/libc/timezone'
require 'ffi/libc/ifaddrs'
require 'ffi/libc/rusage'

require 'ffi'

module FFI
  module LibC
    extend FFI::Library

    ffi_lib [FFI::CURRENT_PROCESS, 'c']

    NULL = nil

    # errno.h
    attach_variable :sys_errlist, :pointer
    attach_variable :sys_nerr, :int
    attach_variable :errno, :int

    def self.raise_error(error=self.errno)
      raise(strerror(error))
    end

    # unistd.h
    attach_function :brk, [:pointer], :int
    attach_function :sbrk, [:pointer], :pointer
    attach_function :getpid, [], :pid_t
    attach_function :getppid, [], :pid_t
    attach_function :getuid, [], :uid_t
    attach_function :geteuid, [], :uid_t
    attach_function :getgid, [], :gid_t
    attach_function :getegid, [], :gid_t
    attach_function :alarm, [:uint], :uint

    # stdlib.h
    attach_function :calloc, [:size_t, :size_t], :buffer_inout
    attach_function :malloc, [:size_t], :pointer
    attach_function :free, [:pointer], :void
    attach_function :realloc, [:pointer, :size_t], :pointer
    attach_function :getenv, [:string], :string
    attach_function :putenv, [:string], :int
    attach_function :unsetenv, [:string], :int

    begin
      attach_function :clearenv, [], :int
    rescue FFI::NotFoundError
      # clearenv is not available on OSX
    end

    # time.h
    attach_function :time, [:pointer], :time_t

    # sys/time.h
    attach_function :gettimeofday, [:pointer, :pointer], :int
    attach_function :settimeofday, [:pointer, :pointer], :int

    # sys/mman.h
    attach_function :mmap, [:pointer, :size_t, :int, :int, :int, :off_t], :pointer
    attach_function :munmap, [:pointer, :size_t], :int

    # string.h
    attach_function :bzero, [:pointer, :size_t], :void
    attach_function :memset, [:pointer, :int, :size_t], :pointer
    attach_function :memcpy, [:buffer_out, :buffer_in, :size_t], :pointer
    attach_function :memcmp, [:buffer_in, :buffer_in, :size_t], :int
    attach_function :memchr, [:buffer_in, :int, :size_t], :pointer

    begin
      attach_function :memrchr, [:buffer_in, :int, :size_t], :pointer
    rescue FFI::NotFoundError
      # memrchr is not available on OSX
    end

    attach_function :strcpy, [:buffer_out, :string], :pointer
    attach_function :strncpy, [:buffer_out, :string, :size_t], :pointer
    attach_function :strcmp, [:buffer_in, :buffer_in], :int
    attach_function :strncmp, [:buffer_in, :buffer_in, :size_t], :int
    attach_function :strlen, [:buffer_in], :size_t
    attach_function :index, [:buffer_in, :int], :pointer
    attach_function :rindex, [:buffer_in, :int], :pointer
    attach_function :strchr, [:buffer_in, :int], :pointer
    attach_function :strrchr, [:buffer_in, :int], :pointer
    attach_function :strstr, [:buffer_in, :string], :pointer
    attach_function :strerror, [:int], :string

    begin
      attach_variable :stdin, :pointer
      attach_variable :stdout, :pointer
      attach_variable :stderr, :pointer
    rescue FFI::NotFoundError
      # stdin, stdout, stderr are not available on OSX
    end

    attach_function :fopen, [:string, :string], :FILE
    attach_function :fdopen, [:int, :string], :FILE
    attach_function :freopen, [:string, :string, :FILE], :FILE
    attach_function :fseek, [:FILE, :long, :int], :int
    attach_function :ftell, [:FILE], :long
    attach_function :rewind, [:FILE], :void
    attach_function :fread, [:buffer_out, :size_t, :size_t, :FILE], :size_t
    attach_function :fwrite, [:buffer_in, :size_t, :size_t, :FILE], :size_t
    attach_function :fgetc, [:FILE], :int
    attach_function :fgets, [:buffer_out, :int, :FILE], :pointer
    attach_function :fputc, [:int, :FILE], :int
    attach_function :fputs, [:buffer_in, :FILE], :int
    attach_function :fflush, [:FILE], :int
    attach_function :fclose, [:FILE], :int
    attach_function :clearerr, [:FILE], :void
    attach_function :feof, [:FILE], :int
    attach_function :ferror, [:FILE], :int
    attach_function :fileno, [:FILE], :int
    attach_function :perror, [:string], :void

    attach_function :putc, [:int, :FILE], :int
    attach_function :putchar, [:int], :int
    attach_function :puts, [:string], :int

    # netdb.h
    attach_function :getnameinfo, [
      :pointer,
      :socklen_t, :pointer,
      :socklen_t, :pointer,
      :socklen_t, :int
    ], :int

    NI_MAXHOST = 1024
    NI_MAXSERV = 32

    NI_NUMERICHOST = 1       # Don't try to look up hostname.
    NI_NUMERICSERV = 2       # Don't convert port number to name.
    NI_NOFQDN      = 4       # Only return nodename portion.
    NI_NAMEREQD    = 8       # Don't return numeric addresses.
    NI_DGRAM       = 16      # Look up UDP service rather than TCP.

    # ifaddrs.h
    attach_function :getifaddrs, [:pointer], :int
    attach_function :freeifaddrs, [:pointer], :void

    def self.each_ifaddrs
      ptr = MemoryPointer.new(:pointer)

      if getifaddrs(ptr) == -1
        raise_error
      end

      ifaddrs = Ifaddrs.new(ptr.get_pointer(0))

      until ifaddrs.null?
        yield ifaddrs

        ifaddrs = ifaddrs.next
      end

      freeifaddrs(ptr.get_pointer(0))
    end

    # /usr/include/bits/resource.h on Linux
    # /usr/include/sys/resource.h on Darwin
    RUSAGE_SELF = 0
    RUSAGE_CHILDREN = -1
    RUSAGE_THREAD = 1 # Linux/glibc only

    attach_function :sys_getrusage, :getrusage, [:int, :pointer], :int

    def self.getrusage(who=RUSAGE_SELF)
      ru = RUsage.new
      ret = sys_getrusage(who, ru)
      raise_error(ret) unless ret == 0
      ru
    end
  end
end
