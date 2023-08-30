class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :category
      t.string :company_name
      t.integer :aspiration
      t.string :mypage_url

      t.timestamps
    end
  end
end
