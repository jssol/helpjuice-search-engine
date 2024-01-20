class HomeController < ApplicationController
  def index
    @latest_searches = Search.order(created_at: :desc).limit(20)
  end
end
