class Ticket < ActiveRecord::Base
	has_many :applications
	validates :title, presence: true
	validates :application, presence:true
	validates :summary, presence:true


end
