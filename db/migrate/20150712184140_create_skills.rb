class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string  :name,          null: false,                limit: 20
      t.boolean :is_required,   null: false, default:false
      # Polymorphic association
      t.integer :skillable_id,   null: false, index: true
      t.string  :skillable_type, null: false,                limit: 10 # Candidate or Company

      t.timestamps null: false
    end
    add_index :skills, [:skillable_id, :skillable_type], unique: true
  end
end


