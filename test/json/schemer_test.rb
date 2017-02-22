require 'test_helper'

class JSON::SchemerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::JSON::Schemer::VERSION
  end

  def test_that_generate_returns_a_hash
    assert ::JSON::Schemer.generate(nil).is_a?(Hash)
  end
end
