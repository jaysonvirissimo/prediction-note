class Prediction < ActiveRecord::Base
  validates :statement, :deadline, presence: true
end
