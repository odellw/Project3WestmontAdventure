class CreateAdventures < ActiveRecord::Migration[5.1]
  def change
    create_table :adventures do |t|
      t.string :name
      t.text :description
      t.string :creator

      t.timestamps
    end
  end
end
