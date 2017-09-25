class Link < ApplicationRecord
  has_many :votes
  belongs_to :user
  validates :url, :title, presence:true
end
