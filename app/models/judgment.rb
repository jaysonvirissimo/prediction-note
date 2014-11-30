class Judgment < ActiveRecord::Base
  STATUS = %w(undetermined falsified verified)

  validates :user_id, :prediction_id, presence: true
  validates :status, inclusion: { in: STATUS }

  belongs_to(:user)
  belongs_to(:prediction)
end
