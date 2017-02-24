class OrderSerializer < ActiveModel::Serializer

  attribute   :id, json_schema: {type: :integer}

  attribute   :user_status, key: :status, json_schema: {enum: ["New", "Processing", "Delivered"]}

  attribute   :created_at, json_schema: {type: :string}

  attribute   :delivered_at, if: -> { true }, json_schema: {type: :string}

  attribute   :pickup_at, unless: -> { true }, json_schema: {type: :string}

  has_many    :items

  has_one     :rating

  belongs_to  :user

end
