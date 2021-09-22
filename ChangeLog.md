### 0.1.1 / 2021-09-22

* Removed `sys_errlist` and `sys_nerr` variables, as they have been removed
  from glibc (see:
  https://sourceware.org/pipermail/libc-announce/2020/000029.html).
* Load `libc` via `FFI::Library::LIBC`.

### 0.1.0 / 2013-08-15

* Require ffi ~> 1.0.
* Added `alarm`.
* Added `clock`.
* Added `getc`.
* Added `getchar`.
* Added `gets`.
* Added `ungetc`.
* Added `getifaddrs`.
* Added `puts`.
* Added `putchar`.
* Added `putc`.
* Added `strcmp`.
* Added `strncmp`.
* Added {FFI::LibC::NULL}.
* Added {FFI::LibC::Ifaddrs}.
* Added {FFI::LibC.raise_error}.
* Added {FFI::LibC.each_ifaddr}.
* Added {FFI::LibC.rusage}.

### 0.0.5 / 2011-05-11

* Skip `clearenv`, `memrchr`, `stdin`, `stdout` and `stderr` if they cannot
  be loaded (thanks FreneticEntropy and mephux).
  * The `libc` installed on OSX lacks these functions/global-variables.
* Opt into [test.rubygems.org](http://test.rubygems.org/).

### 0.0.4 / 2011-02-03

* Require ffi >= 0.6.0, <= 1.1.0:
  * JRuby requires ffi >= 1.0.0.
  * A lot of projects still require ffi ~> 0.6.0.
* Added `stdin`.
* Added `stdout`.
* Added `stderr`.

### 0.0.3 / 2010-08-03

* Load libc from the current process.
* Added `getgid` and `getegid`.
* Added `getuid` and `geteuid`.
* Added `getpid` and `getppid`.

### 0.0.2 / 2010-05-21

* Removed a duplicate typedef of the `size_t` type.
* Added the Structs:
  * {FFI::LibC::InAddr}.
  * {FFI::LibC::In6Addr}.
  * {FFI::LibC::Sockaddr}.
  * {FFI::LibC::SockaddrDL}.
  * {FFI::LibC::SockaddrIn}.
  * {FFI::LibC::SockaddrIn6}.

### 0.0.1 / 2010-05-19

* Initial release.
* Added the Structs:
  * {FFI::LibC::Timeval}.
  * {FFI::LibC::Timezone}.
* Added the variables:
  * `sys_errlist`
  * `sys_nerr`
  * `errno`
* Added the functions:
  * `brk`
  * `sbrk`
  * `calloc`
  * `malloc`
  * `free`
  * `realloc`
  * `getenv`
  * `putenv`
  * `unsetenv`
  * `clearenv`
  * `time`
  * `gettimeofday`
  * `settimeofday`
  * `mmap`
  * `munmap`
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
