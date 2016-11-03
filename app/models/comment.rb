class Comment < ActiveRecord::Base
  validates_presence_of :response
  belongs_to :commenter, class_name: "User"
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true
end
