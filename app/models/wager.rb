class Wager < ActiveRecord::Base
  validates :user_id, :prediction_id, :probability, presence: true
  validates :probability, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }
end
