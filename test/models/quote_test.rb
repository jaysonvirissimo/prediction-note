# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  author     :string(255)      not null
#  quote      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
