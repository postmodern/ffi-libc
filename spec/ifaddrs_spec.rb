require 'spec_helper'
require 'ffi/libc/ifaddrs'

describe Ifaddrs do
  subject { LibC.each_ifaddr.first }

  it "should have a name" do
    subject.name.should_not be_empty
  end

  it "should have flags" do
    subject.flags.should be_kind_of(Integer)
  end

  it "should have an addr" do
    subject.addr.should be_kind_of(Sockaddr)
  end

  it "should have an netmask" do
    subject.netmask.should be_kind_of(Sockaddr)
  end

  it "should have a broadcast addr" do
    subject.broadaddr.should be_kind_of(Sockaddr)
  end

  it "should have a destination addr" do
    subject.dstaddr.should be_kind_of(Sockaddr)
  end
end
