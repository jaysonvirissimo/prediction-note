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
#  judged     :boolean          default(FALSE)
#

class Prediction < ActiveRecord::Base
  validates :statement, :deadline, presence: true
  belongs_to(:user)
  has_many(:wagers)
  has_one(:judgment)

  def self.parse_datetime(string)
    Chronic.parse(string)
  end

  def self.unjudged_count
    # come up with more performant solution for this
    Prediction.where('judged = ? AND deadline < ?', false, Time.now).count
  end

  def average_wager
    sum = 0

    wagers.each do |wager|
      sum += wager.probability
    end

    (sum.to_f / wagers.length).round
  end
end
