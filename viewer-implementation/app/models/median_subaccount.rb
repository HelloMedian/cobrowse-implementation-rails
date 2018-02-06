class MedianSubaccount < ApplicationRecord
  belongs_to :company

  # This is an array of information. We're serializing because we use SQLlite for this demo.
  # if you're using Postgres or similar, check out the array column type
  serialize :excluded_selectors
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
