# ffi-libc

* [Source](http://github.com/postmodern/ffi-libc/)
* [Issues](http://github.com/postmodern/ffi-libc/issues)
* [Documentation](http://rubydoc.info/gems/ffi-libc)
* [Email](postmodern.mod3 at gmail.com)

## Description

Useful Ruby FFI bindings for `libc`.

## Features

* Provides common Structs used in `libc`:
  * {FFI::LibC::Ifaddrs}
  * {FFI::LibC::In6Addr}
  * {FFI::LibC::InAddr}
  * {FFI::LibC::SockaddrDL}
  * {FFI::LibC::SockaddrFamily}
  * {FFI::LibC::SockaddrIn6}
  * {FFI::LibC::SockaddrIn}
  * {FFI::LibC::Sockaddr}
  * {FFI::LibC::Timeval}
  * {FFI::LibC::Timezone}
  * {FFI::LibC::RUsage}
* Binds to common functions and global variables in `libc`:
  * `errno.h`:
    * `sys_errlist`
    * `sys_nerr`
    * `errno`
  * `unistd.h`:
    * `brk`
    * `sbrk`
    * `getpid`
    * `getppid`
    * `getuid`
    * `geteuid`
    * `getgid`
    * `getegid`
  * `stdlib.h`:
    * `calloc`
    * `malloc`
    * `free`
    * `realloc`
    * `getenv`
    * `putenv`
    * `unsetenv`
    * `clearenv`
  * `time.h`:
    * `time`
  * `sys/time.h`:
    * `gettimeofday`
    * `settimeofday`
  * `sys/resource.h` / `bits/resource.h`:
    * `getrusage`
  * `sys/mman.h`:
    * `mmap`
    * `munmap`
  * `string.h`:
    * `bzero`
    * `memset`
    * `memcpy`
    * `memcmp`
    * `memchr`
    * `memrchr`
    * `strcpy`
    * `strncpy`
    * `strlen`
    * `index`
    * `rindex`
    * `strchr`
    * `strrchr`
    * `strstr`
    * `strerror`
  * `stdio.h`:
    * `stdin`
    * `stdout`
    * `stderr`
    * `fopen`
    * `fdopen`
    * `freopen`
    * `fseek`
    * `ftell`
    * `rewind`
    * `fread`
    * `fwrite`
    * `fgetc`
    * `fgets`
    * `fputc`
    * `fputs`
    * `fflush`
    * `fclose`
    * `clearerr`
    * `feof`
    * `ferror`
    * `fileno`
    * `perror`
  * `netdb.h`:
    * `getnameinfo`
  * `ifaddrs.h`:
    * `getifaddrs`
    * `freeifaddrs`

## Requirements

* [ffi](http://github.com/ffi/ffi) ~> 1.0

## Install

    $ sudo gem install ffi-libc

## License

Copyright (c) 2010-2011 Hal Brodigan

See {file:LICENSE.txt} for license information.
