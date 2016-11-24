require 'spec_helper'

describe TimestampAsBoolean do
  before(:each) do
    @now = Time.current
    allow(Time).to receive(:current) { @now }
  end

  context "default `at` field" do
    class SampleClass
      include TimestampAsBoolean
      attr_accessor :example_at

      timestamp_as_boolean :example
    end

    it "sets the time when the boolean value is true" do
      x = SampleClass.new
      x.example = true
      expect(x.example_at).to be @now
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

  context "specific `at` field" do
    class SampleOverrideClass
      include TimestampAsBoolean
      attr_accessor :example2_at

      timestamp_as_boolean :example, :example2_at
    end

    it "sets the time when the boolean value is true" do
      x = SampleOverrideClass.new
      x.example = true
      expect(x.example2_at).to be @now
    end

    it "resets the timestamp to nil when the value is false" do
      x = SampleOverrideClass.new
      x.example2_at = Time.now

      x.example = false
      expect(x.example2_at).to be nil
    end

    it "does not change the timestamp when the value is assigned true again" do
      x = SampleOverrideClass.new
      x.example2_at = Time.now
      expected_time = x.example2_at

      x.example = true
      expect(x.example2_at).to be expected_time
    end
  end

end
