# Git::Remote::Parser

[![Build Status](https://travis-ci.org/JuanitoFatas/git-remote-parser.svg?branch=master)][travis]

[travis]: https://travis-ci.org/JuanitoFatas/git-remote-parser

## Usage

This gem can parse remote urls into `Git::Remote::Parser::Result` object:

```ruby
> parser = Git::Remote::Parser.new
=> #<Git::Remote::Parser:0x007ffd5c0d4718>

> result = parser.parse "git@github.com:torvalds/linux.git"
=> #<Git::Remote::Parser::Result:0x007fb11b82fc70 @protocol=nil, @username="git", @host="github.com", @owner="torvalds", @repo="linux", @html_url="https://github.com/torvalds/linux">

> result.host
=> "github.com"

> result.owner
=> "torvalds"

> result.repo
=> "linux"

> result.html_url
=> "https://github.com/torvalds/linux"

> result.to_h
=> {:protocol=>nil, :username=>"git", :host=>"github.com", :owner=>"torvalds", :repo=>"linux", :html_url=>"https://github.com/torvalds/linux"}
```

Tested work for these Git providers:

* [GitHub][github]

  Examples:

  - `https://github.com/torvalds/linux.git`
  - `git@github.com:torvalds/linux.git`

* [Gitlab][gitlab]

  Examples:

  - `https://gitlab.com/gitlab-org/gitlab-ce.git`
  - `git@gitlab.com:gitlab-org/gitlab-ce.git`

* [Bitbucket][bitbucket]

  Examples:

  - `https://JuanitoFatas@bitbucket.org/ged/ruby-pg`
  - `ssh://hg@bitbucket.org/ged/ruby-pg`
  - and legacy host `bitbucket.com`

[github]: https://github.com
[gitlab]: https://gitlab.com
[bitbucket]: https://bitbucket.org

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git-remote-parser'

# or double quote if you prefer:

gem "git-remote-parser"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git-remote-parser

## Contributing

See [CONTRIBUTING.md](/CONTRIBUTING.md)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
