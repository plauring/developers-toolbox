class User < ActiveRecord::Base
  has_many :devtools
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :encrypted_password, presence: true

end
