module Badges
  class ByAttemptsRuleSpecification < AbstractRuleSpecification
    def satisfies?
      attempts = TestPassage.where(
        test: @test_passage.test,
        user: @test_passage.user
      )
      attempts.count == 1 && attempts.first.done?
    end
  end
end
