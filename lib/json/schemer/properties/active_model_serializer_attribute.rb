require "json/schemer/properties/active_model_serializer_base"

module JSON
  module Schemer
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

      private

        def options
          attribute.options
        end

      end
    end
  end
end
