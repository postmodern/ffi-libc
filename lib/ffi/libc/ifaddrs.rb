require 'ffi/libc/ifaddrs_union'
require 'ffi/libc/sockaddr'

module FFI
  module LibC
    #
    # @since 0.1.0
    #
    class Ifaddrs < FFI::Struct

      layout :ifa_next,    :pointer,
             :ifa_name,    :string,
             :ifa_flags,   :uint,
             :ifa_addr,    :pointer,
             :ifa_netmask, :pointer,
             :ifa_ifu,     IfaddrsUnion,
             :ifa_data,    :pointer

      #
      # Gets the next Interface Address in the list.
      #
      # @return [Ifaddrs]
      #   The next Interface Address in the list.
      #
      def next
        Ifaddrs.new(self[:ifa_next])
      end

      #
      # The name of the Interface.
      #
      # @return [String]
      #   The name.
      #
      def name
        self[:ifa_name]
      end

      #
      # The flags of the Interface.
      #
      # @return [Integer]
      #   The flags.
      #
      def flags
        self[:ifa_flags]
      end

      #
      # The address of the Interface.
      #
      # @return [Sockaddr]
      #   The basic socket address.
      #
      def addr
        Sockaddr.new(self[:ifa_addr])
      end

      #
      # The netmask of the Interface.
      #
      # @return [Sockaddr]
      #   The socket address containing the netmask.
      #
      def netmask
        Sockaddr.new(self[:ifa_netmask])
      end

      #
      # The broadcast address of the Interface.
      #
      # @return [Sockaddr]
      #   The broadcast address.
      #
      def ifa_broadaddr
        Sockaddr.new(self[:ifa_ifu][:ifu_broadaddr])
      end

      #
      # The destination address of the Interface.
      #
      # @return [Sockaddr]
      #   The destination address.
      #
      def ifa_dstaddr
        Sockaddr.new(self[:ifa_ifu][:ifu_dstaddr])
      end

    end
  end
end
