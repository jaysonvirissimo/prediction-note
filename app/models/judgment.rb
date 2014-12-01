# == Schema Information
#
# Table name: judgments
#
#  id            :integer          not null, primary key
#  prediction_id :integer          not null
#  user_id       :integer          not null
#  status        :string(255)      default("undetermined")
#  created_at    :datetime
#  updated_at    :datetime
#

class Judgment < ActiveRecord::Base
  STATUS = %w(undetermined falsified verified)

  validates :user_id, :prediction_id, presence: true
  validates :status, inclusion: { in: STATUS }

  belongs_to(:user)
  belongs_to(:prediction)
end
