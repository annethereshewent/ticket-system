class Ticket < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	validates :title, presence: true
	validates :application, presence:true
	validates :summary, presence:true


end
