class Review < ActiveRecord::Base
  belongs_to :devtool
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, numericality: {only_integer: true}, inclusion: { in: 1..5, message: "must be between 1 - 5" }
  validates :devtool_id, presence: true

end
