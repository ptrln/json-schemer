require "json_schemer/version"
require "json_schemer/active_model_serializer_generator"

module JSONSchemer

  def self.generate(serializer)
    if serializer.respond_to?(:_attributes_data) && serializer.respond_to?(:_reflections)
      ::JSONSchemer::ActiveModelSerializerGenerator.new(serializer).json_schema
    else
      nil
    end
  end

  def self.mock(serializer)
    schema = generate(serializer)
    if schema
      mock_json = {}
      schema[:properties].each do |name, attributes|
        if attributes[:examples].present?
          mock_json[name] = attributes[:examples].sample
        elsif attributes[:enum].present?
          mock_json[name] = attributes[:enum].sample
        end
      end
      mock_json
    end
  end

end
