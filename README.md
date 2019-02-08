# JsonUpdater

This gem will help you update your json files to a given pattern. It will be useful for fixtures that contain many json files and are frequently updated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_updater'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_updater

## Usage

To use this gem just write:

    $ json_updater path_to_etalon_file.json path_to_changeable_file.json 
    
You can add new fields or delete old ones at any nesting level. Everything works well for fields with arrays too.

## Examples

<details>
<summary>
   <h3> Add new fields  </h3>
</summary>
   
```json
# etalon_file.json
{
  "name": "John",
  "age": 30,
  "car": null,
  "available": null,
  "another_field": null,
  "one_more_field": null
}

# changeable_file.json
{
  "name": "Nick",
  "age": 12,
  "car": null
}

# json_updater etalon_file.json changeable_file.json
# result =>

{
  "name": "Nick",
  "age": 12,
  "car": null,
  "available": null,
  "another_field": null,
  "one_more_field": null
}
```
</details>
___
<details>
<summary>
   <h3> Remove old fields  </h3>
</summary>
   
```json
# etalon_file.json
{
  "name": "John"
}

# changeable_file.json
{
  "name": "Nick",
  "age": 12,
  "car": null
}

# json_updater etalon_file.json changeable_file.json
# result =>
{
  "name": "Nick"
}

```
</details>
___

<details>
<summary>
   <h3> Add new fields to hash inside array  </h3>
</summary>
   
```json
# etalon_file.json
{
  "cars": [{
    "model": "BMV",
    "country": "Germany",
    "motor": null,
    "main": {
      "number": "2",
      "document_id": "1"
    }
  }]
}

# changeable_file.json
{
  "cars": [
    {
      "model": "Mazda",
      "country": "Japan",
      "main": {
        "number": "20",
        "document_id": "1"
      }
    },
    {
      "model": "Zil",
      "country": "Russia",
      "main": {
        "number": "21",
        "document_id": "1"
      }
    },
    {
      "model": "Ford",
      "country": "USA",
      "main": {
        "number": "22",
        "document_id": "1"
      }
    }
  ]
}

# json_updater etalon_file.json changeable_file.json
# result =>
{
  "cars": [
    {
      "model": "Mazda",
      "country": "Japan",
      "motor": null,
      "main": {
        "number": "20",
        "document_id": "1"
      }
    },
    {
      "model": "Zil",
      "country": "Russia",
      "motor": null,
      "main": {
        "number": "21",
        "document_id": "1"
      }
    },
    {
      "model": "Ford",
      "country": "USA",
      "motor": null,
      "main": {
        "number": "22",
        "document_id": "1"
      }
    }
  ]
}

```
</details>
___

<details>
<summary>
   <h3> Update the lowest level of nesting </h3>
</summary>
   
```json
# etalon_file.json
{
  "name": "Petr",
  "age": 22,
  "car": {
    "model": "BMV",
    "country": {
      "name": "Germany",
      "language": "germanese",
      "population": [{
        "size": "80 mln",
        "highest_age": "88",
        "average_age": "55"
      }]
    }
  }
}

# changeable_file.json
{
  "name": "Nick",
  "age": 12,
  "car": {
    "model": "Mazda",
    "country": {
      "name": "Japan",
      "language": "japanese",
      "population": [
      {
        "size": "120 mln",
        "highest_age": "101"
      },
      {
        "size": "320 mln",
        "highest_age": "99"
      }
    ]
    }
  }
}


# json_updater etalon_file.json changeable_file.json
# result =>
{
  "name": "Nick",
  "age": 12,
  "car": {
    "model": "Mazda",
    "country": {
      "name": "Japan",
      "language": "japanese",
      "population": [
        {
          "size": "120 mln",
          "highest_age": "101",
          "average_age": "55"
        },
        {
          "size": "320 mln",
          "highest_age": "99",
          "average_age": "55"
        }
      ]
    }
  }
}

```
</details>
___



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/juggleross/json_updater. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JsonUpdater project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/json_updater/blob/master/CODE_OF_CONDUCT.md).
