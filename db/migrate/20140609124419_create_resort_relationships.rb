class CreateResortRelationships < ActiveRecord::Migration
  def change
    create_table :resort_relationships do |t|
      t.references :instructor
      t.references :resort
      t.string :instructor_state
      t.boolean :favorite

      t.timestamps
    end
    add_index :resort_relationships, :instructor_id
    add_index :resort_relationships, :resort_id
  end
end
