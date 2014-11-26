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

  def self.parse_datetime(string)
    Chronic.parse(string)
  end
end
