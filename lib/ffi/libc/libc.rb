require 'ffi/libc/types'

require 'ffi'

module FFI
  module LibC
    extend FFI::Library

    ffi_lib 'c'

    # errno.h
    attach_variable :sys_errlist, :pointer
    attach_variable :sys_nerr, :int
    attach_variable :errno, :int

    # stdlib.h
    attach_function :calloc, [:size_t, :size_t], :pointer
    attach_function :malloc, [:size_t], :pointer
    attach_function :free, [:pointer], :void
    attach_function :realloc, [:pointer, :size_t], :pointer

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
    attach_function :fopen, [:string, :string], :FILE
    attach_function :fdopen, [:int, :string], :FILE
    attach_function :freopen, [:string, :string, :FILE], :FILE
    attach_function :fseek, [:FILE, :long, :int], :int
    attach_function :ftell, [:FILE], :long
    attach_function :rewind, [:FILE], :void
    attach_function :fread, [:pointer, :size_t, :size_t, :FILE], :size_t
    attach_function :fwrite, [:pointer, :size_t, :size_t, :FILE], :size_t
    attach_function :fgetc, [:FILE], :int
    attach_function :fgets, [:pointer, :int, :FILE], :pointer
    attach_function :fputc, [:int, :FILE], :int
    attach_function :fputs, [:string, :FILE], :int
    attach_function :fflush, [:FILE], :int
    attach_function :fclose, [:FILE], :int
    attach_function :clearerr, [:FILE], :void
    attach_function :feof, [:FILE], :int
    attach_function :ferror, [:FILE], :int
    attach_function :fileno, [:FILE], :int
    attach_function :perror, [:string], :void
  end
end
