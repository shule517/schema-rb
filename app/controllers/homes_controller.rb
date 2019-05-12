class HomesController < ApplicationController
  def index
    @tables = Table.all
    @repositories = Repository.rails.order(stargazers_count: :desc)
  end
end
