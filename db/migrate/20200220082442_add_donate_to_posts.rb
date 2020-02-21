class AddDonateToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :current_donate, :float, default: 0
    add_column :posts, :desired_donate, :float, default: 0
  end
end
