class Ticket < ActiveRecord::Base
	validates :title, presence: true
	validates :application, presence:true
	validates :summary, presence:true
end
