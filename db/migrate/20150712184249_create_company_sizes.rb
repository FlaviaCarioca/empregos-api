class CreateCompanySizes < ActiveRecord::Migration[5.1]
  def change
    create_table :company_sizes do |t|
      t.string :size, null: false, limit: 10

      t.timestamps null: false
    end
  end
end


