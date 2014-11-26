# == Schema Information
#
# Table name: wagers
#
#  id            :integer          not null, primary key
#  prediction_id :integer          not null
#  probability   :integer          not null
#  user_id       :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class WagerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
