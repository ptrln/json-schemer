require "json/schemer/properties/active_model_serializer_base"

module JSON
  module Schemer
    module Properties
      class ActiveModelSerializerAssociation < ActiveModelSerializerBase
        attr_reader :reflection

        def initialize(reflection)
          @reflection = reflection
        end

        def name
          reflection.name
        end

      private

        def options
          reflection.options
        end

      end
    end
  end
end
