class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :email,         null: false, limit: 50, unique: true
      t.string  :password,      null: false, limit: 50

      # Polymorphic association
      t.integer :profile_id,   null: false,                           index: true
      t.string  :profile_type, null: false, limit: 10 # Candidate or Company

      t.timestamps null: false
    end
    add_index :users, [:profile_id, :profile_type], unique: true
  end
end
