# == Schema Information
#
# Table name: tables
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Table < ApplicationRecord
  has_many :links, class_name: 'TableLink', dependent: :destroy
end
