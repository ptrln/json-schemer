require "json/schemer/version"
require "json/schemer/active_model_serializer_generator"

module JSON
  module Schemer

    def self.generate(serializer)
      if serializer.respond_to?(:_attributes_data) && serializer.respond_to?(:_reflections)
        ::JSON::Schemer::ActiveModelSerializerGenerator.new(serializer).json_schema
      else
        nil
      end
    end

  end
end
