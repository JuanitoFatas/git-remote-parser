require "git/remote/parser/version"

module Git
  module Remote
    class Parser
      class Result
        attr_reader :protocol, :username, :host, :owner, :repo, :html_url

        def initialize(protocol, username, host, owner, repo, html_url)
          @protocol = protocol
          @username = username
          @host = host
          @owner = owner
          @repo = repo
          @html_url = html_url
        end

        def to_h
          {
            protocol: protocol,
            username: username,
            host: host,
            owner: owner,
            repo: repo,
            html_url: html_url,
          }
        end
      end

      REGEXP = %r(
        (?<protocol>(http://|https://|git://|ssh://))*
        (?<username>[^@]+@)*
        (?<host>[^/]+)
        [/:]
        (?<owner>[^/]+)
        /
        (?<repo>[^/.]+)
      )x

      def parse(remote_uri)
        if matched = remote_uri.match(REGEXP)
          Result.new(
            matched[:protocol],
            matched[:username] && matched[:username].delete("@".freeze),
            matched[:host],
            matched[:owner],
            matched[:repo],
            File.join("https://#{matched[:host]}", matched[:owner],matched[:repo]),
          )
        end
      end
    end
  end
end
