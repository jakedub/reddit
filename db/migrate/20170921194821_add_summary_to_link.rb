class AddSummaryToLink < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :summary, :string
  end
end
