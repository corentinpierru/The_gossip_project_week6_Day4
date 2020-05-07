class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tag_gossips
  has_many :tags, through: :tag_gossips
  has_many :comments
  has_many :likes

  #Title is mandatory and should be between 3 and 14 characters.
  validates :title, presence: true,
  length: { in: 3..14 }

  validates :content, presence: true
end
