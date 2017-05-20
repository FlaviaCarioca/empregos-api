class CreateSpecializations < ActiveRecord::Migration[5.1]
  def change
    create_table :specializations do |t|
      t.string :name, null: false, limit: 25

      t.timestamps null: false
    end
  end
end



