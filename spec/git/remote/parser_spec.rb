require "spec_helper"

describe Git::Remote::Parser do
  it "has a version number" do
    expect(Git::Remote::Parser::VERSION).not_to be nil
  end
end
