require 'spec_helper'

describe TimestampAsBoolean do
  class SampleClass
    include TimestampAsBoolean
    attr_accessor :example_at

    timestamp_as_bool :example_at
  end

  it "sets the time when the boolean value is true" do
    x = SampleClass.new
    x.example = true
    expect(x.example_at).not_to be nil
  end

  it "resets the timestamp to nil when the value is false" do
    x = SampleClass.new
    x.example_at = Time.now

    x.example = false
    expect(x.example_at).to be nil
  end

  it "does not change the timestamp when the value is assigned true again" do
    x = SampleClass.new
    x.example_at = Time.now
    expected_time = x.example_at

    x.example = true
    expect(x.example_at).to be expected_time
  end
end
