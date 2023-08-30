class CreateSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :selections do |t|
      t.integer :company_id
      t.integer :status
      t.date :es_deadline
      t.string :is_intern
      t.string :next_plan
      t.date :plan_date
      t.string :note

      t.timestamps
    end
  end
end
