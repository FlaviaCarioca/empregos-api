class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :company_name, null: false, limit: 150
      t.string :title,        null: false, limit: 50
      t.string :date_from,    null: false, limit: 7
      t.string :date_to,                   limit: 7

      t.references :candidate, null: false, index: true, name: 'fk_candidates_positions'

      t.timestamps null: false
    end
  end
end


