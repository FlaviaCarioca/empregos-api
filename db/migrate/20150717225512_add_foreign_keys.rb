class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :candidates, :specializations
    add_foreign_key :candidates, :company_sizes
    add_foreign_key :candidates, :job_types
    add_foreign_key :schools, :candidates, on_delete: :cascade
    add_foreign_key :positions, :candidates, on_delete: :cascade
  end
end
