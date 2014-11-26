# == Schema Information
#
# Table name: wagers
#
#  id            :integer          not null, primary key
#  prediction_id :integer          not null
#  probability   :integer          not null
#  user_id       :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Wager < ActiveRecord::Base
  validates :user_id, :prediction_id, :probability, presence: true
  validates :probability, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }
  belongs_to(:user)
  belongs_to(:prediction)
end
