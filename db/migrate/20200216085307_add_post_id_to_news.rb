class AddPostIdToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :post_id, :integer
  end
end
