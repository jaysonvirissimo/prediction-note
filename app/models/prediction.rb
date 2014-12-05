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
  validates :statement, length: { in: (1..140) }
  validates :statement, uniqueness: true
  # validate :date_must_be_in_future
  belongs_to(:user)
  has_many(:wagers)
  has_many(:judgments)

  def self.parse_datetime(string)
    Chronic.parse(string)
  end

  def self.due_for_judgment_count
    Prediction.due_for_judgment.count
  end

  def self.due_for_judgment
    Prediction.where('judged = ? AND deadline < ?', false, Time.now)
  end

  def average_wager
    sum = 0

    wagers.each do |wager|
      sum += wager.probability
    end

    (sum.to_f / wagers.length).round
  end

  private

  # def date_must_be_in_future
  #   return if self.deadline.nil?
  #
  #   if self.deadline < Time.now
  #     errors.add(:deadline, "must be in the future... this isn't RetrodictionNote")
  #   end
  # end
end
