class User < ApplicationRecord
  has_many :tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests

  def tests_level(level)
    Test.joins('JOIN user_passed_tests ON user_passed_tests.test_id = tests.id')
      .where(tests: { level: level} )
      .where(user_passed_tests: { user_id: id })
  end
end
