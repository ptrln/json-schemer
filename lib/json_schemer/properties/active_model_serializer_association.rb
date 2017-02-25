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

      def schema
        {
          type: AMS_ASSOCIATION_TYPES_MAP[reflection.class.to_s],
        }.merge(options[:json_schema] || {})
      end

    private

      def options
        reflection.options
      end

      AMS_ASSOCIATION_TYPES_MAP = {
        "ActiveModel::Serializer::HasManyReflection"    => :array,
        "ActiveModel::Serializer::HasOneReflection"     => :object,
        "ActiveModel::Serializer::BelongsToReflection"  => :object,
      }.freeze

    end
  end
end
