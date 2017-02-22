module JSON
  module Schemer
    class ActiveModelSerializerGenerator
      attr_reader :serializer

      def initialize(serializer)
        @serializer = serializer
      end

      def json_schema
        {}
      end
    end
  end
end
