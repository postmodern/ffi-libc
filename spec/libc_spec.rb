require 'spec_helper'

describe "FFI::LibC" do
  it "should attach all functions" do
    lambda {
      require 'ffi/libc/libc'
    }.should_not raise_error(FFI::NotFoundError)
  end
end
