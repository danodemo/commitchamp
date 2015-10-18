require "httparty"
require "pry"
require "set"

require "commitchamp/version"
require "commitchamp/githelper"
# Probably you also want to add a class for talking to github.

module Commitchamp
  class App
    def initialize
    end

    def authorizeyoshit
      #prepares GitHelper with the appropriate authorization
      puts "Please enter your personal Authorization token:"
      auth_token = STDIN.gets.chomp
      @githelper = GitHelper.new(auth_token)
    end

    def run
      #binding.pry
      authorizeyoshit
      #githelper is now authorized to kickass
      puts "You are now ready to use GitHelper.  Please specify the owner or organization you are looking for:"
      owner = STDIN.gets.chomp
      puts "You are now searching the owner: #{owner}.  Which repo are you looking for?"
      repo = STDIN.gets.chomp
      #owner and repo now ready to pass around
      puts "GitHelper is now ready to use! Getting Repo information..."
      contribs = @githelper.contributors(owner, repo)
      binding.pry

    end
  end
end

app = Commitchamp::App.new
app.run
