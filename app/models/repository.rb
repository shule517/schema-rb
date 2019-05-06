# == Schema Information
#
# Table name: repositories
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  full_name        :string
#  description      :string
#  html_url         :string
#  homepage         :string
#  language         :string
#  stargazers_count :integer
#  pushed_at        :datetime
#

class Repository < ApplicationRecord
end
