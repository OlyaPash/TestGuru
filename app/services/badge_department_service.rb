class BadgeDepartmentService
  RULES = {
    category: Badges::ByCategoryRuleSpecification,
    level:    Badges::ByLevelRuleSpecification,
    attempts: Badges::ByAttemptsRuleSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      condition = RULES[badge.rule.to_sym].new(badge.rule_value, @test_passage)
      @test_passage.user.user_badges.create(badge: badge) if condition.satisfies?
    end
  end

end
