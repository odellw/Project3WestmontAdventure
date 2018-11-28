class CreateDecisions < ActiveRecord::Migration[5.1]
  def change
    create_table :decisions do |t|
      t.string :decisionDescription
      t.references :scene, foreign_key: true
      t.integer :sceneToGoTO

      t.timestamps
    end
  end
end
