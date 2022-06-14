class CreateUserPassedTests < ActiveRecord::Migration[7.0]
  def change
    create_table :user_passed_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.index [:user_id, :test_id], unique: true

      t.timestamps
    end
  end
end
