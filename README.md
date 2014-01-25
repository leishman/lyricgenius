# Lyricgenius

Get song lyrics and metadata based on query

## Installation

Add this line to your application's Gemfile:

    gem 'lyricgenius'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lyricgenius

## Usage

Search for song information:
```ruby
agent = LyricGenius::Song.new
song_information = agent.search "real slim shady"
```
Output:
```ruby
{
    :title => "The Real Slim Shady Lyrics",
    :artist => "Eminem",
    :lyrics => "\n    \n  [Eminem]May I have your attention please\nMay I have your attention please
    Will the real Slim Shady please stand ...(REMAINDER OF LYRICS)...\nFuck it, let’s all stand up"
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
