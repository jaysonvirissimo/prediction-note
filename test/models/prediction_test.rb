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

require 'test_helper'

class PredictionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
