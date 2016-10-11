class User < ActiveRecord::Base
  mount_uploader :profile_picture, ProfilePictureUploader
  has_many :devtools

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  def admin?
    role == 'admin'
  end

end
