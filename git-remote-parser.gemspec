# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "git/remote/parser/version"

Gem::Specification.new do |spec|
  spec.name          = "git-remote-parser"
  spec.version       = Git::Remote::Parser::VERSION
  spec.authors       = ["JuanitoFatas"]
  spec.email         = ["katehuang0320@gmail.com"]

  spec.summary       = %q{Parse Git Remote into Useful hash.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/JuanitoFatas/git-remote-parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|bin)/}) }
  spec.require_paths = ["lib"]
end
