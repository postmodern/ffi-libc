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
  * {FFI::LibC::SockAddr}.
  * {FFI::LibC::SockAddrDL}.
  * {FFI::LibC::SockAddrIn}.
  * {FFI::LibC::SockAddrIn6}.

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
