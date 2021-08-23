class Project < ApplicationRecord
  mount_uploader :icon, ImageUploader
end
