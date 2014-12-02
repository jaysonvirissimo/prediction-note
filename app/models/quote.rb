# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  author     :string(255)      not null
#  quote      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Quote < ActiveRecord::Base
  validates :author, :quote, presence: true
end
