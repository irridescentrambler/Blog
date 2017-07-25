class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :miniprofiler

  private
    def miniprofiler
      Rack::MiniProfiler.authorize_request # if user.admin?
    end
end
