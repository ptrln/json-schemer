require 'spec_helper'
require 'serializers/order_serializer'

describe JSON::Schemer do

  it "has a version number" do
    expect(::JSON::Schemer::VERSION).to_not be_nil
  end

  it "return nil when not passed nil" do
    expect(::JSON::Schemer.generate(nil)).to be_nil
  end

  it "return nil when not passed a supported serializer" do
    expect(::JSON::Schemer.generate({})).to be_nil
  end

  it "does not return nil when passed a active model serializer" do
    expect(::JSON::Schemer.generate(OrderSerializer)).to_not be_nil
  end

end
