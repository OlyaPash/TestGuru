class User < ApplicationRecord

  def tests_level(level)
    Test.joins('JOIN user_passed_tests ON user_passed_tests.test_id = tests.id')
      .where(tests: { level: level} )
      .where(user_passed_tests: { user_id: id })
  end
end
