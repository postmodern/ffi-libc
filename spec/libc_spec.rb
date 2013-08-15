require 'spec_helper'
require 'ffi/libc'

describe FFI::LibC do
  describe "NULL" do
    subject { described_class::NULL }

    it { should == nil }
  end

  describe "each_ifaddr" do
    it "should yield Ifaddrs" do
      addrs = []

      described_class.each_ifaddr do |ifaddr|
        addrs << ifaddr
      end

      addrs.all? { |addr| addr.kind_of?(Ifaddrs) }.should be_true
    end

    context "when not given a block" do
      subject { described_class.each_ifaddr }

      it { should be_kind_of(Enumerable) }
    end
  end

  describe "rusage" do
    subject { described_class.rusage }

    it "should be able to fetch its own memory usage" do
      subject[:ru_maxrss].should be > 4000
    end
  end
end
