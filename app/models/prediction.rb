class Prediction < ActiveRecord::Base
  validates :statement, :deadline, presence: true
  belongs_to(:user)
  has_many(:wagers)
end
