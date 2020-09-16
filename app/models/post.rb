class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :comments, dependent: :delete_all
end
