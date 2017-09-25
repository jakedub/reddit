class Link < ApplicationRecord
  has_many :votes
  belongs_to :user
  validates :title, presence:true
  validates :url, presence:true, uniqueness:true

  def upvote_by
    if validates :url, uniqueness: false
      vote
      redirect_to :root
    end
  end
end
