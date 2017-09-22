class AddUserIdAddLinkIdToVotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :user, foreign_key: true
    add_reference :votes, :link, foreign_key: true
  end
end
