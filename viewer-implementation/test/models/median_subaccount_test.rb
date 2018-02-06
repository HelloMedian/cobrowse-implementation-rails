require 'test_helper'

class MedianSubaccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: median_subaccounts
#
#  id                      :integer          not null, primary key
#  company_id              :integer
#  subaccount_id           :string
#  dev_mode                :boolean
#  request_permission      :boolean
#  request_permission_text :string
#  excluded_selectors      :string
#  phone_mode              :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_median_subaccounts_on_company_id  (company_id)
#
