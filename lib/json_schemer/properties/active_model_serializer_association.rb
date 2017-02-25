require "json_schemer/properties/active_model_serializer_base"

module JSONSchemer
  module Properties
    class ActiveModelSerializerAssociation < ActiveModelSerializerBase
      attr_reader :key, :reflection

      def initialize(key, reflection)
        @key        = key
        @reflection = reflection
      end

      def name
        options[:key] || reflection.name
      end

    private

      def options
        reflection.options
      end

    end
  end
end
