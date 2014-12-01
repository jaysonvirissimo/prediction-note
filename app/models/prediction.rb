# == Schema Information
#
# Table name: predictions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  statement  :string(255)      not null
#  deadline   :datetime         not null
#  created_at :datetime
#  updated_at :datetime
#

class Prediction < ActiveRecord::Base
  validates :statement, :deadline, presence: true
  belongs_to(:user)
  has_many(:wagers)
  has_one(:judgment)

  def self.parse_datetime(string)
    Chronic.parse(string)
  end

  def average_wager
    sum = 0

    self.wagers.each do |wager|
      sum += wager.probability
    end

    (sum.to_f / self.wagers.length).round
  end
end
