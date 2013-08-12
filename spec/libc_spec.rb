require 'spec_helper'

describe "FFI::LibC" do
  it "should attach all functions" do
    lambda {
      require 'ffi/libc/libc'
    }.should_not raise_error
  end

  it "should be able to fetch its own memory usage" do
    require 'ffi/libc'
    ru = FFI::LibC.getrusage
    ru[:ru_maxrss].should be > 4000
  end
end
