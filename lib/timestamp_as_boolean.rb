require "timestamp_as_boolean/version"
require "active_support"
require "active_support/core_ext/object/blank"
require "active_support/core_ext/time"

module TimestampAsBoolean
  extend ActiveSupport::Concern

  module ClassMethods
    # this should only be used with timestamps end in "_at"
    # NEXT STEPS:
    # add optional parameter to name the field instead of using magic

    POSSIBLE_TRUTHY_VALUES = [true, '1', 't', 'true'].freeze

    def timestamp_as_boolean(method, attrx = nil)
      attrx ||= "#{method}_at"

      @@timestamped_to_bool_list ||= []
      @@timestamped_to_bool_list << method.to_sym

      define_method method do
        eval("#{attrx}.present?")
      end

      define_method "#{method}=" do |val|
        if val.present? && POSSIBLE_TRUTHY_VALUES.include?(val)
          send("#{attrx}=", Time.current) if send(attrx).nil? # Use the setter to preserve AR dirty tracking.
        else
          send("#{attrx}=", nil)
        end
      end
    end

    def timestamped_to_bool_list
      @@timestamped_to_bool_list
    end
  end
end
