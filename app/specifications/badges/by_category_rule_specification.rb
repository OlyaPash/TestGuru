module Badges
  class ByCategoryRuleSpecification < AbstractRuleSpecification
    def satisfies?
      category = @rule_value.to_i
      return false if category != @test_passage.test.category_id

      all_category_test = Test.where(category_id: category).ids.sort
      completed_category_test = @test_passage.user.tests.where(category_id: category).distinct.ids.sort
      completed_category_test == all_category_test
    end
  end
end
