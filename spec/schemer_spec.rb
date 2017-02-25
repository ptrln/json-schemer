require 'spec_helper'
require 'serializers/order_serializer'

describe JSONSchemer do

  it "has a version number" do
    expect(::JSONSchemer::VERSION).to_not be_nil
  end

  it "return nil when not passed nil" do
    expect(::JSONSchemer.generate(nil)).to be_nil
  end

  it "return nil when not passed a supported serializer" do
    expect(::JSONSchemer.generate({})).to be_nil
  end

  it "does not return nil when passed a active model serializer" do
    expect(::JSONSchemer.generate(OrderSerializer)).to_not be_nil
  end

end
