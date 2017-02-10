# == Schema Information
#
# Table name: customer_services
#
#  id             :integer          not null, primary key
#  name           :string(191)
#  phone          :string(191)
#  subdistrict_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_customer_services_on_subdistrict_id  (subdistrict_id)
#

class CustomerService < ActiveRecord::Base
	scope :subdistrict_is, ->(id){where(subdistrict_id: id)}
end
