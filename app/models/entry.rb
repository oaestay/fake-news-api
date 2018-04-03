class Entry < ApplicationRecord
  has_many :comments

  default_scope { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true
end
