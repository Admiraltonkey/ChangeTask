class AddImgToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :img, :string
  end
end
