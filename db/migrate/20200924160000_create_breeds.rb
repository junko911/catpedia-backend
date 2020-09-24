class CreateBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :temperament
      t.string :life_span
      t.string :wikipedia_url
      t.string :origin
      t.boolean :rare
      t.boolean :hypoallergenic
      t.integer :child_friendly
      t.integer :dog_friendly
      t.integer :energy_level
      t.integer :intelligence
      t.integer :shedding_level
      t.integer :social_needs
      t.integer :stranger_friendly

      t.timestamps
    end
  end
end
