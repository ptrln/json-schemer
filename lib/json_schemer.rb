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

end
