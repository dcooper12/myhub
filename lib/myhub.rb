require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"

module Myhub
  class App < Sinatra::Base
    set :logging, true

    # Your code here ...
    get "/" do
      api = Github.new
      issues = api.issues
      # get stuff from github
      erb :index, locals: { issues: issues }
    end

    post "/issue/reopen/:id" do
      api = Github.new
      api.reopen_issue(params["id"].to_i)
      redirect to("/")
    end

    post "/issue/close/:id" do
      api = Github.new
      api.close_issue(params["id"].to_i)
      redirect to("/")
    end

    run! if app_file == $0
  end
end
