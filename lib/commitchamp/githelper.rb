require 'pry'

module Commitchamp
  class GitHelper

    include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
      @auth = {
        "Authorization" => "token #{auth_token}",
        "User-Agent" => "HTTParty"
      }
      @repos = []
    end

    def contributors(owner, repo)
      self.class.get( "/repos/#{owner}/#{repo}/stats/contributors", headers: @auth)
    #binding.pry
    end

    def getrepos(owner, options={})
      self.class.get("/orgs/#{owner}/repos",
                    headers: @auth,
                    body: options.to_json)
    end

end
end