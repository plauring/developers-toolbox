class Devtool < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :title, uniqueness: true, presence: true
  validates :body, uniqueness: true, presence: true
  validates :github_link, uniqueness: true

  def rating
  #   call the foreign key in our reviews table and pull the rating from each foreign key then average it.
  end

end
