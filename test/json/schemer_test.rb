require 'test_helper'
require 'serializers/plain_order_serializer'

class JSON::SchemerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::JSON::Schemer::VERSION
  end

  def test_that_generate_returns_a_hash_when_passed_nil
    assert ::JSON::Schemer.generate(nil).is_a?(Hash)
  end

  def test_that_generate_returns_a_hash_when_passed_ams
    assert ::JSON::Schemer.generate(PlainOrderSerializer).is_a?(Hash)
  end
end
