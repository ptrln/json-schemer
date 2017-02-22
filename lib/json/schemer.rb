require "json/schemer/version"
require "json/schemer/active_model_serializer_generator"

module JSON
  module Schemer

    def self.generate(serializer)
      ::JSON::Schemer::ActiveModelSerializerGenerator.new(serializer).json_schema
    end

  end
end
