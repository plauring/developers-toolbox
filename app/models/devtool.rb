class Devtool < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :title, uniqueness: true, presence: true
  validates :body, uniqueness: true, presence: true
  validates :github_link, uniqueness: true

  def self.rate(devtool)
    @reviews = devtool.reviews
    @total_rating = 0
    @reviews.each do |review|
      @total_rating += review.rating.to_f
    end
    if @reviews.count.nonzero?
      @average_rating = (@total_rating / @reviews.count)
    end
    @average_rating
  end

  def self.search(search)
    if search
      where('title iLIKE ?', "%#{search}%").order('id DESC')
    else
      order('id DESC')
    end
  end

end
