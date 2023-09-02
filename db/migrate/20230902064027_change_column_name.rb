class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :plans, :start_date, :start_time
  end
end
