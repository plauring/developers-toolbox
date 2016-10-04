class Review < ActiveRecord::Base
  belongs_to :devtool
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, numericality: {minimum: 0, maximum: 5}
end
