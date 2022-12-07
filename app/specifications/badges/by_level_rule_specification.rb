module Badges
  class ByLevelRuleSpecification < AbstractRuleSpecification
    def satisfies?
      level_value = @rule_value.to_i
      return false if level_value != @test_passage.test.level

      all_tests_level = Test.where(level: level_value).pluck(:id)
      all_passages_level = @test_passage.user.test_passages.where(current_question_id: nil, test: all_tests_level).pluck(:test_id).uniq
      all_tests_level.sort == all_passages_level.sort
    end
  end
end
