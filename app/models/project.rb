class Project < ApplicationRecord
  mount_uploader :icon, ImageUploader
  has_many :associates
  has_many :projects, through: :associates
  has_many :posts
end
