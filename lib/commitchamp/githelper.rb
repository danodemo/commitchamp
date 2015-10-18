require 'pry'
require 'set'
require 'httparty'

module Githubber
  class GitHelper
    include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
      @auth = {
        "Authorization" => "token #{auth_token}",
        "User_Agent" => "HTTParty"
      }
    end

    def list_commits(owner, repo)
      self.class.get("/repos/#{owner}/#{repo}/commits", :headers => @auth)
    end

    def contributors(owner, repo)
      self.class.get( "/repos/#{@repo_owner}/#{repo}/stats/contributors", :headers => @auth)
    end
