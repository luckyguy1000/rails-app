class Post < ApplicationRecord
  validates :title, presence: true
  validates :description,
    presence: true,
    length: { maximum: 9000 }

  has_many :comments, dependent: :delete_all
end
