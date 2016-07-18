require "spec_helper"

RSpec.describe Git::Remote::Parser do
  it "has a version number" do
    expect(Git::Remote::Parser::VERSION).not_to be nil
  end

  def parser
    Git::Remote::Parser.new
  end

  context "no match" do
    it "returns nil" do
      result = parser.parse "https://twitter.com"

      expect(result).to be nil
    end
  end

  describe "#to_h" do
    it "coerce into hash" do
      result = parser.parse("https://github.com/torvalds/linux.git").to_h

      expect(result).to eq({
        protocol: "https://",
        username: nil,
        host: "github.com",
        owner: "torvalds",
        repo: "linux",
        html_url: "https://github.com/torvalds/linux"
      })
    end
  end

  context "GitHub" do
    it "https" do
      result = parser.parse "https://github.com/torvalds/linux.git"

      expect(result).to have_attributes({
        protocol: "https://",
        username: nil,
        host: "github.com",
        owner: "torvalds",
        repo: "linux",
        html_url: "https://github.com/torvalds/linux"
      })
    end

    it "ssh" do
      result = parser.parse "git@github.com:torvalds/linux.git"

      expect(result).to have_attributes({
        protocol: nil,
        username: "git",
        host: "github.com",
        owner: "torvalds",
        repo: "linux",
        html_url: "https://github.com/torvalds/linux"
      })
    end
  end

  context "GitLab" do
    it "https" do
      result = parser.parse "https://gitlab.com/gitlab-org/gitlab-ce.git"

      expect(result).to have_attributes({
        protocol: "https://",
        username: nil,
        host: "gitlab.com",
        owner: "gitlab-org",
        repo: "gitlab-ce",
        html_url: "https://gitlab.com/gitlab-org/gitlab-ce"
      })
    end

    it "ssh" do
      result = parser.parse "git@gitlab.com:gitlab-org/gitlab-ce.git"

      expect(result).to have_attributes({
        protocol: nil,
        username: "git",
        host: "gitlab.com",
        owner: "gitlab-org",
        repo: "gitlab-ce",
        html_url: "https://gitlab.com/gitlab-org/gitlab-ce"
      })
    end
  end

  context "Bitbucket" do
    it "https" do
      result = parser.parse "https://JuanitoFatas@bitbucket.org/ged/ruby-pg"

      expect(result).to have_attributes({
        protocol: "https://",
        username: "JuanitoFatas",
        host: "bitbucket.org",
        owner: "ged",
        repo: "ruby-pg",
        html_url: "https://bitbucket.org/ged/ruby-pg"
      })
    end

    it "ssh" do
      result = parser.parse "ssh://hg@bitbucket.org/ged/ruby-pg"

      expect(result).to have_attributes({
        protocol: "ssh://",
        username: "hg",
        host: "bitbucket.org",
        owner: "ged",
        repo: "ruby-pg",
        html_url: "https://bitbucket.org/ged/ruby-pg"
      })
    end

    context "bitbucket.com" do
      it "https" do
        result = parser.parse "https://JuanitoFatas@bitbucket.com/ged/ruby-pg"

        expect(result).to have_attributes({
          protocol: "https://",
          username: "JuanitoFatas",
          host: "bitbucket.com",
          owner: "ged",
          repo: "ruby-pg",
          html_url: "https://bitbucket.com/ged/ruby-pg"
        })
      end

      it "ssh" do
        result = parser.parse "ssh://hg@bitbucket.com/ged/ruby-pg"

        expect(result).to have_attributes({
          protocol: "ssh://",
          username: "hg",
          host: "bitbucket.com",
          owner: "ged",
          repo: "ruby-pg",
          html_url: "https://bitbucket.com/ged/ruby-pg"
        })
      end
    end
  end
end
