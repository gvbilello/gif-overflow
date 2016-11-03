class User < ActiveRecord::Base
  has_secure_password

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :answerer_id
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id

  validates_uniqueness_of :username, :email

end
