class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :content
      t.datetime :start_date

      t.timestamps
    end
  end
end
