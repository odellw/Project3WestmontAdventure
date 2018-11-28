class CreateScenes < ActiveRecord::Migration[5.1]
  def change
    create_table :scenes do |t|
      t.string :sceneName
      t.text :description
      t.references :adventure, foreign_key: true

      t.timestamps
    end
  end
end
