require 'ffi/libc/ifaddrs_union'
require 'ffi/libc/sockaddr'

module FFI
  module LibC
    class Ifaddrs < FFI::Struct

      layout :ifa_next,    :pointer,
             :ifa_name,    :string,
             :ifa_flags,   :uint,
             :ifa_addr,    :pointer,
             :ifa_netmask, :pointer,
             :ifa_ifu,     IfaddrsUnion,
             :ifa_data,    :pointer

      def next;  Ifaddrs.new(self[:ifa_next]); end
      def name;  self[:ifa_name];              end
      def flags; self[:ifa_flags];             end

      def addr;    Sockaddr.new(self[:ifa_addr]);    end
      def netmask; Sockaddr.new(self[:ifa_netmask]); end

      def ifa_broadaddr; self[:ifa_ifu][:ifu_broadaddr]; end
      def ifa_dstaddr;   self[:ifa_ifu][:ifu_dstaddr];   end
    end
  end
end
