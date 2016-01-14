class Address < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :name, :phone_number, :plot_no, :street, :locality, :city, :state, :pincode
end
