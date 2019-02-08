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

```json
# the simplest example

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/juggleross/json_updater. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JsonUpdater project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/json_updater/blob/master/CODE_OF_CONDUCT.md).
