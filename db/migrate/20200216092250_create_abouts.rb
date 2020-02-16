class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.string :name
      t.string :surname
      t.string :city
      t.date :data

      t.timestamps
    end
  end
end
