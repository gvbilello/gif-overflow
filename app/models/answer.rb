class Answer < ActiveRecord::Base
  belongs_to :answerer, class_name: "User"
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates_presence_of :gif

  validates_format_of :gif, with: /.*\.(jpg|jpeg|png|gif)/

  def points
    self.votes.sum(:vote_direction)
  end
end
