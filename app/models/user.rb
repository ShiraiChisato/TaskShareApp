class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :associates, dependent: :destroy
  has_many :projects, through: :associates
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  mount_uploader :icon, ImageUploader
end
