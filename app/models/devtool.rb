class Devtool < ActiveRecord::Base
  has_many :reviews

  validates :title, uniqueness: true, presence: true
  validates :body, unqiueness: true, presence: true

  def rating
  #   call the foreign key in our reviews table and pull the rating from each foreign key then average it.
  end

end
