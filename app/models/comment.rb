class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :parent, class_name: 'Comment', optional: true

  validates :content,
    presence: true,
    length: { maximum: 3000 }

  scope :top_level, -> { where(parent_id: nil) }

  def to_anchor
    "comment-#{id}"
  end
end
