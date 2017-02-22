module JSON
  module Schemer
    module Properties
      class ActiveModelSerializerBase

        def required?
          !options.has_key?(:if) && !options.has_key?(:unless)
        end

      end
    end
  end
end
