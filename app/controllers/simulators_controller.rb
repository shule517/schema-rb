class SimulatorsController < ApplicationController
  def index
    @model_name = 'User'
    @table_name = @model_name.tableize
  end
end
