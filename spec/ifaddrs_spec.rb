require 'spec_helper'
require 'ffi/libc/ifaddrs'

describe Ifaddrs do
  subject { LibC.each_ifaddr.first }

  it "should have a name" do
    expect(subject.name).to_not be_empty
  end

  it "should have flags" do
    expect(subject.flags).to be_kind_of(Integer)
  end

  it "should have an addr" do
    expect(subject.addr).to be_kind_of(Sockaddr)
  end

  it "should have an netmask" do
    expect(subject.netmask).to be_kind_of(Sockaddr)
  end

  it "should have a broadcast addr" do
    expect(subject.broadaddr).to be_kind_of(Sockaddr)
  end

  it "should have a destination addr" do
    expect(subject.dstaddr).to be_kind_of(Sockaddr)
  end
end
