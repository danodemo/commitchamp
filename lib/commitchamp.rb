require "httparty"
require "githelper"
require "pry"
require "set"

require "commitchamp/version"
# Probably you also want to add a class for talking to github.

module Commitchamp
  class App
    def initialize
    end

    def authorizeyoshit
      #prepares GitHelper with the appropriate authorization
      puts "Please enter your personal Authorization token:"
      auth_token = STDIN.gets.chomp
      githelper = GitHelper.new(auth_token)
    end

    def run
      authorizeyoshit
      #githelper is now authorized to kickass
      puts "You are now ready to use GitHelper.  Please specify the owner you are looking for:"
      owner = STDIN.gets.chomp
      puts "You are now searching through the user #{owners}.  Which repo are you looking for?"
      repo = STDIN.gets.chomp
      puts "GitHelper is now ready to use! Getting Repo information..."
      
    end
  end
end

app = Commitchamp::App.new
app.run
