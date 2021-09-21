class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :projects, through: :user_projects
  has_many :user_projects
  has_many :posts

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  mount_uploader :icon, ImageUploader
end
