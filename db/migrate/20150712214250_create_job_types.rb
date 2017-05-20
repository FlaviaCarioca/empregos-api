class CreateJobTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :job_types do |t|
      t.string :name, null: false, limit: 11

      t.timestamps null: false
    end
  end
end


