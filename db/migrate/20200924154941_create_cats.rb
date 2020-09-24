class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
