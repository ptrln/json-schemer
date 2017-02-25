require "json_schemer/properties/active_model_serializer_base"

module JSONSchemer
  module Properties
    class ActiveModelSerializerAttribute < ActiveModelSerializerBase
      attr_reader :key, :attribute

      def initialize(key, attribute)
        @key       = key
        @attribute = attribute
      end

      def name
        key
      end

      def schema
        options[:json_schema] || {}
      end

    private

      def options
        attribute.options
      end

    end
  end
end
