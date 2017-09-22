class Link < ApplicationRecord
  acts_as_votable
  has_many :votes
  belongs_to :user
end
