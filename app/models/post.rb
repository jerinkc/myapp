class Post < ApplicationRecord
  has_rich_text :description

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :description, presence: true
end
