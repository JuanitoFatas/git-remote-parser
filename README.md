# Git::Remote::Parser

## Usage

This gem can parse remote urls:

```ruby
parser = Git::Remote::Parser.new

> parser.parse "git@github.com:torvalds/linux.git"
=> { host: "github.com", owner: "torvalds", repo: "linux", html_url: "https://github.com/torvalds/linux" }

> parser.parse "git@gitlab.com:gitlab-org/gitlab-ce.git"
=> { host: "gitlab.com", owner: "gitlab-org", repo: "gitlab-ce", html_url: "https://gitlab.com/gitlab-org/gitlab-ce" }

> parser.parse "ssh://hg@bitbucket.org/ged/ruby-pg"
=> { host: "gitlab.com", owner: "ged", repo: "ruby-pg", html_url: "https://bitbucket.org/ged/ruby-pg" }
```

Currently support parsing for these Git providers:

* [GitHub][github]

  - https://github.com/torvalds/linux.git
  - git@github.com:torvalds/linux.git

* [Gitlab][gitlab]

  - https://gitlab.com/gitlab-org/gitlab-ce.git
  - git@gitlab.com:gitlab-org/gitlab-ce.git

* [Bitbucket][bitbucket]

  - https://JuanitoFatas@bitbucket.org/ged/ruby-pg
  - ssh://hg@bitbucket.org/ged/ruby-pg
  - and legacy bitbucket.com

[github]: https://github.com
[gitlab]: https://gitlab.com
[bitbucket]: https://bitbucket.org

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git-remote-parser'

# or double quote:

gem "git-remote-parser"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git-remote-parser

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/hack` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JuanitoFatas/git-remote-parser.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
