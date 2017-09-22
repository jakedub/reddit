class AddTotalToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :totalcount, :integer
  end
end
