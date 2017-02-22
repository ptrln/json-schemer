require "json/schemer/properties/active_model_serializer_attribute"
require "json/schemer/properties/active_model_serializer_association"

module JSON
  module Schemer
    class ActiveModelSerializerGenerator
      attr_reader :serializer

      def initialize(serializer)
        @serializer = serializer
      end

      def json_schema
        {
          type:         :object,
          properties:   properties.map { |p| [p.name, {}] }.to_h,
          required:     properties.select(&:required?).map(&:name),
        }
      end

    private

      def properties
        @memo_properties ||= attribute_properties + association_properties
      end

      def attribute_properties
        serializer._attributes_data.map { |k, v| Properties::ActiveModelSerializerAttribute.new(k, v) }
      end

      def association_properties
        serializer._reflections.map { |r| Properties::ActiveModelSerializerAssociation.new(r) }
      end

    end
  end
end
