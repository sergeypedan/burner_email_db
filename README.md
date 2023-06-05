# Burner email DB

[![Gem Version](https://badge.fury.io/rb/burner_email_db.svg)](https://badge.fury.io/rb/burner_email_db)
[![Build Status](https://travis-ci.org/sergeypedan/burner_email_db.svg?branch=master)](https://travis-ci.org/sergeypedan/burner_email_db)

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

  def validate_each(record, attribute_name, address)
    return if address.blank? # validate presence separately
    record.errors.add attribute_name, :disposable_email if disposable?(address)
  end

  private def disposable?(address_with_unknown_case)
    address = address_with_unknown_case.downcase
    BurnerEmailDB.domains.any? { |burner_domain| address.include? burner_domain }
  end

end
```

Add translations:

```yaml
---
ru:
  errors:
    messages:
      disposable_email: в сервисе одноразовых email-адресов
```

and then use it like so:

```ruby
class User
  validates :email, presence: true, burner_email: true
end
```

### Dry validation

WIP, I promise, Piotr!

## Alternatives

- https://github.com/disposable/disposable
- https://open.kickbox.io
