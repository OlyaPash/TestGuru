class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions
  has_many :user_passed_tests
  has_many :users, through: :user_passed_tests

  def self.tests_by_category(title_category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
