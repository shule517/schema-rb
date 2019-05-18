# == Schema Information
#
# Table name: table_links
#
#  id            :integer          not null, primary key
#  table_id      :integer
#  repository_id :integer
#  path          :string
#  line          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TableLink < ApplicationRecord
  belongs_to :table
  belongs_to :repository

  def source_url
    "https://github.com/#{repository.full_name}/tree/master/app/models/#{table.name.underscore}.rb"
  end
end
