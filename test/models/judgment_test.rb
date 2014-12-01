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

require 'test_helper'

class JudgmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
