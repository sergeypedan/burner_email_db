# Burner email DB

A very long list (119 261) of burner email domains, packaged for Ruby gems.

## Sourse

Copied with much respect from Wes Bos’s [repo](https://github.com/wesbos/burner-email-providers).

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem "burner_email_db"
```

## Usage

### Just list everything

```ruby
BurnerEmailDB.domains #=> ["0-00.usa.cc", "0-180.com", ...]
```

### ActiveModel validation

```ruby
class User
  validates :email, exclusion: { in: BurnerEmailDB.domains }
end
```

### ActiveModel validator

You could write a validator:

```ruby
class BurnerEmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute_name, email_address)
    return if email_address.blank? # validate presence separately
    record.errors.add attribute_name, :disposable_email if disposable?(email_address)
  end

  def disposable?(email_address)
    BurnerEmailDB.domains.any? { |domain| email_address.include? domain }
  end
end

# Перевод нужно добавить в:
# ru:
#   activemodel:
#     errors:
#       messages:
#         invalid_format: некорректного формата
#         disposable_email: в сервисе одноразовых email-адресов
```

and then use it like so:

```ruby
class User
  validates :email, presence: true, burner_email: true
end
```

### Dry validation

WIP, I promise, Piotr!
