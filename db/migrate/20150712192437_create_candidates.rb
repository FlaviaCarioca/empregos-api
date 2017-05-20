class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string  :first_name,     null: false, limit: 50
      t.string  :last_name,      null: false, limit: 70
      t.string  :address,                     limit: 100
      t.string  :city,                        limit: 50
      t.string  :state,                       limit: 2
      t.string  :zip,                         limit: 5
      t.string  :title,                       limit: 100
      t.text    :description
      t.string  :minimum_salary,              limit: 7
      t.string  :linkedin,                    limit: 50
      t.string  :github,                      limit: 50
      t.boolean :is_active,                              default: true
      t.boolean :can_relocate,                           default: true
      t.boolean :can_remote,                             default: true
      t.boolean :is_visa_needed,                         default: true

      t.references :specialization, index: true, name: 'fk_specializations_candiates'
      t.references :company_size,   index: true, name: 'fk_company_sizes_candidates'
      t.references :job_type,       index: true, name: 'fk_job_types_candidates'

      t.timestamps null: false
    end
  end
end
