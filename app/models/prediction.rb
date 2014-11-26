class Prediction < ActiveRecord::Base
  validates :statement, :deadline, presence: true
  belongs_to(:user)
  has_many(:wagers)

  def self.parse_datetime(string)
    Chronic.parse(string)
  end
end
