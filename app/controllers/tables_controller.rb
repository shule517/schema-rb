class TablesController < ApplicationController
  def index
    @tables = Table.all.order(:name)
  end
end
