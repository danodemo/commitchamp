require "httparty"
require "pry"
require "set"

require "commitchamp/version"
require "commitchamp/githelper"


module Commitchamp
  class App

    include HTTParty
    base_uri "https://api.github.com"
    
    def initialize
    end

    def authorizeyoshit
      #prepares GitHelper with the appropriate authorization
      puts "Please enter your personal Authorization token:"
      auth_token = STDIN.gets.chomp
      @githelper = GitHelper.new(auth_token)
    end

    def prettytable(contribs)
      @data = []
    contribs.map do |contrib|
        author = contrib["author"]
        weeks = contrib["weeks"]
        a = 0
        d = 0
        c = 0
        weeks.map do |week|
          a += week["a"]
          d += week["d"]
          c += week["c"]
        end
        @data.push({l: author, a: a, d: d, c: c})
      end
      #puts  "User      Additions   Deletions   Changes"
      #contribs.each do |hash|
      #  hash[:thethingweneedtofind].each do |hash2|
      #puts  "#{:user}     #{:adds.sum}    #{:deletes.sum}   #{:changes.sum}"
      #  end    
      #end
    end

    def run
      #binding.pry
      authorizeyoshit
      #githelper is now authorized to kickass
      puts "You are now ready to use GitHelper.  Please specify the owner or organization you are looking for"
      owner = STDIN.gets.chomp
      puts "You are now searching the owner: #{owner}.  Which repo are you looking for? Leave blank for all"
      repo = STDIN.gets.chomp
      #owner and repo now ready to pass around
      puts "GitHelper is now ready to use! Getting Repo information..."
      puts 
      contribs = @githelper.contributors(owner, repo)
      binding.pry
      #this returned something
      prettytable(contribs)
      #this does nothing yet
    end

  end
end

app = Commitchamp::App.new
app.run
