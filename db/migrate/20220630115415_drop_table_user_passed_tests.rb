class DropTableUserPassedTests < ActiveRecord::Migration[7.0]
  def up
    drop_table :user_passed_tests, if_exists: true
  end
end
