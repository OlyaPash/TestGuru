class AddTablesDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:tests, :level, from: nil, to: 1)
    change_column_default(:answers, :correct, from: true, to: false)
  end
end
