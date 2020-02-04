class AddAboutToCreatePosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :about, :text
  end
end
