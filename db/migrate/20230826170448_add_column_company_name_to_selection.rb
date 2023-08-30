class AddColumnCompanyNameToSelection < ActiveRecord::Migration[7.0]
  def change
    add_column :selections, :company_name, :string
  end
end
