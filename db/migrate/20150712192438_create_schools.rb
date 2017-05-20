class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name,       null: false, limit: 50
      t.string :degree,                  limit: 150
      t.string :date_from,  null: false, limit: 7
      t.string :date_to,                 limit: 7

      t.references :candidate, null: false, index: true, name: 'fk_candidates_schools'

      t.timestamps null: false
    end
  end
end
