class Product < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :university
	geocoded_by :full_street_address
	after_validation :geocode, if: ->(obj){ obj.street.present? and obj.street_changed? }

	def full_street_address
	  [street, state, country, postcode].compact.join(', ')
	end
end
