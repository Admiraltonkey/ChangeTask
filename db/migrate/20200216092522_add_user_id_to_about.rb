class AddUserIdToAbout < ActiveRecord::Migration[5.2]
  def change
    add_column :abouts, :user_id, :integer
  end
end
