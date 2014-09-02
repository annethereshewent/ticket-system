class Ticket < ActiveRecord::Base
	has_many :comments, -> { order("created_at DESC" )}
	belongs_to :user
	validates :title, presence: true
	validates :application, presence:true
	validates :summary, presence:true


end
