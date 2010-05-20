require 'ffi/libc/types'
require 'ffi/libc/timeval'
require 'ffi/libc/timezone'

require 'ffi'

module FFI
  module LibC
    extend FFI::Library

    ffi_lib 'c'

    # errno.h
    attach_variable :sys_errlist, :pointer
    attach_variable :sys_nerr, :int
    attach_variable :errno, :int

    # unistd.h
    attach_function :brk, [:pointer], :int
    attach_function :sbrk, [:pointer], :pointer

    # stdlib.h
    attach_function :calloc, [:size_t, :size_t], :pointer
    attach_function :malloc, [:size_t], :pointer
    attach_function :free, [:pointer], :void
    attach_function :realloc, [:pointer, :size_t], :pointer
    attach_function :getenv, [:string], :string
    attach_function :putenv, [:string], :int
    attach_function :unsetenv, [:string], :int
    attach_function :clearenv, [], :int

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
    attach_function :memcpy, [:pointer, :pointer, :size_t], :pointer
    attach_function :memcmp, [:pointer, :pointer, :size_t], :int
    attach_function :memchr, [:pointer, :int, :size_t], :pointer
    attach_function :memrchr, [:pointer, :int, :size_t], :pointer
    attach_function :strcpy, [:string, :string], :pointer
    attach_function :strncpy, [:string, :string, :size_t], :pointer
    attach_function :strlen, [:string], :size_t
    attach_function :index, [:string, :int], :string
    attach_function :rindex, [:string, :int], :string
    attach_function :strchr, [:string, :int], :string
    attach_function :strrchr, [:string, :int], :string
    attach_function :strstr, [:string, :string], :string
    attach_function :strerror, [:int], :string

    # stdio.h
    attach_function :fopen, [:string, :string], :pointer
    attach_function :fdopen, [:int, :string], :pointer
    attach_function :freopen, [:string, :string, :pointer], :pointer
    attach_function :fseek, [:pointer, :long, :int], :int
    attach_function :ftell, [:pointer], :long
    attach_function :rewind, [:pointer], :void
    attach_function :fread, [:pointer, :size_t, :size_t, :pointer], :size_t
    attach_function :fwrite, [:pointer, :size_t, :size_t, :pointer], :size_t
    attach_function :fgetc, [:pointer], :int
    attach_function :fgets, [:pointer, :int, :pointer], :pointer
    attach_function :fputc, [:int, :pointer], :int
    attach_function :fputs, [:string, :pointer], :int
    attach_function :fflush, [:pointer], :int
    attach_function :fclose, [:pointer], :int
    attach_function :clearerr, [:pointer], :void
    attach_function :feof, [:pointer], :int
    attach_function :ferror, [:pointer], :int
    attach_function :fileno, [:pointer], :int
    attach_function :perror, [:string], :void
  end
end
