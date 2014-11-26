# NotesNotifier

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'notes_notifier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install notes_notifier

## Usage

application.rb

```
NotesNotifier.setup do |config|
  config.token = ENV["SLACK_API_TOKEN"]
  config.channel = "#general"
  config.bot_name = "notify bot"
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/notes_notifier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
