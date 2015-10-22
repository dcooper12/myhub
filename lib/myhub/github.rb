module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    # Your code here too!
    def initialize
      @headers = {
        "Authorization"  => "token #{ENV["AUTH_TOKEN"]}",
        "User-Agent"     => "HTTParty"
      }
    end

    def issues
      my_issues = Github.get("/orgs/TIY-ATL-ROR-2015-Sep/issues", headers: @headers, query: { state: "all"})
    end

    def close_issue(owner, repos, number)
      Github.patch("/repos/:owner/:repos/issues/:number", headers:  @headers, query: { state: "close"})
    end

    def open_issue(owner, repos, number)
      Github.patch("/repos/:owner/:repos/issues/:number", headers:  @headers, query: { state: "open"})
    end
  end
end
