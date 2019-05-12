class HomesController < ApplicationController
  def index
    @tables = Table.all.order(:name)
    @repositories = Repository.rails.order(stargazers_count: :desc)
  end
end
