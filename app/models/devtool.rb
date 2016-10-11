class Devtool < ActiveRecord::Base
  has_many :reviews

  validates :title, uniqueness: true, presence: true
  validates :body, uniqueness: true, presence: true
  validates :github_link, uniqueness: true

  def self.rate(devtool)
    @reviews = devtool.reviews
    @totalRating = 0
    @reviews.each do |review|
      @totalRating += review.rating.to_f
    end

    @averageRating = (@totalRating / @reviews.length)
    @averageRating
  #   call the foreign key in our reviews table and pull the rating from each foreign key then average it.
  end

  def self.search(search)
    if search
        where('title iLIKE ?', "%#{search}%").order('id DESC')
    else
      order('id DESC')
    end
  end

end
