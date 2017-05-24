class OrderSerializer < ActiveModel::Serializer

  attribute   :id, json_schema: {type: :integer, examples: ["1"]}

  attribute   :user_status, key: :status, json_schema: {enum: ["New", "Processing", "Delivered"]}

  attribute   :created_at, json_schema: {type: :string, examples: ["Mar 25, 2017,  7:58 PM"]}

  attribute   :delivered_at, if: -> { true }, json_schema: {type: :string, examples: ["Mar 25, 2017,  7:58 PM"]}

  attribute   :pickup_at, unless: -> { true }, json_schema: {type: :string, examples: ["Mar 25, 2017,  7:58 PM"]}

  has_many    :items

  has_one     :rating

  belongs_to  :user

end
