class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user, foreign_key: "user_id"

  validates :body, presence: true
end
