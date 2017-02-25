module JSONSchemer
  module Properties
    class ActiveModelSerializerBase

      def required?
        !options.has_key?(:if) && !options.has_key?(:unless)
      end

    end
  end
end
