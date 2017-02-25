# JSONSchemer

[![Code Climate](https://lima.codeclimate.com/github/ptrln/json_schemer/badges/gpa.svg)](https://lima.codeclimate.com/github/ptrln/json_schemer)

[![Test Coverage](https://lima.codeclimate.com/github/ptrln/json_schemer/badges/coverage.svg)](https://lima.codeclimate.com/github/ptrln/json_schemer/coverage)

[![Issue Count](https://lima.codeclimate.com/github/ptrln/json_schemer/badges/issue_count.svg)](https://lima.codeclimate.com/github/ptrln/json_schemer)

[![Build Status](https://travis-ci.org/ptrln/json_schemer.svg?branch=master)](https://travis-ci.org/ptrln/json_schemer)

Generate JSON Schema from ActiveModelSerializers!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_schemer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_schemer

## Usage

Let's say you have a AMS, like so:

```ruby
class OrderSerializer < ActiveModel::Serializer

  attribute   :id

  attribute   :user_status, key: :status

  attribute   :created_at

  attribute   :delivered_at, if: -> { true }

  attribute   :pickup_at, unless: -> { true }

  has_many    :items

  has_one     :rating

  belongs_to  :user

end
```

You can generate a JSON Schema using JSONSchemer, like so:

```ruby
  JSONSchemer.generate(OrderSerializer)
```

and get this output:

```javascript
{
  "type": "object",
  "properties": {
    "id": {
    },
    "status": {
    },
    "created_at": {
    },
    "delivered_at": {
    },
    "pickup_at": {
    },
    "items": {
      "type": "array"
    },
    "rating": {
      "type": "object"
    },
    "user": {
      "type": "object"
    }
  },
  "required": [
    "id",
    "status",
    "created_at",
    "items",
    "rating",
    "user"
  ]
}
```

You could also write json_schema right in your serializer, like so:

```ruby
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
```

Which would give you this output:

```javascript
{
  "type": "object",
  "properties": {
    "id": {
      "type": "integer"
    },
    "status": {
      "enum": [
        "New",
        "Processing",
        "Delivered"
      ]
    },
    "created_at": {
      "type": "string"
    },
    "delivered_at": {
      "type": "string"
    },
    "pickup_at": {
      "type": "string"
    },
    "items": {
      "type": "array"
    },
    "rating": {
      "type": "object"
    },
    "user": {
      "type": "object"
    }
  },
  "required": [
    "id",
    "status",
    "created_at",
    "items",
    "rating",
    "user"
  ]
}
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ptrln/json_schemer.

