class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :post1,  presence: true
end
