class Project < ApplicationRecord
  mount_uploader :icon, ImageUploader

  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :posts
end
