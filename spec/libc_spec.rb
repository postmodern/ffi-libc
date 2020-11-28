require 'spec_helper'
require 'ffi/libc'

describe FFI::LibC do
  describe "NULL" do
    subject { described_class::NULL }

    it { expect(subject).to be == nil }
  end

  describe "each_ifaddr" do
    it "should yield Ifaddrs" do
      addrs = []

      described_class.each_ifaddr do |ifaddr|
        addrs << ifaddr
      end

      expect(addrs).to all(be_kind_of(Ifaddrs))
    end

    context "when not given a block" do
      subject { described_class.each_ifaddr }

      it { expect(subject).to be_kind_of(Enumerable) }
    end
  end

  describe "rusage" do
    subject { described_class.rusage }

    it "should be able to fetch its own memory usage" do
      expect(subject[:ru_maxrss]).to be > 4000
    end
  end
end
