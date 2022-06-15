class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :user_passed_tests, dependent: :destroy
  has_many :users, through: :user_passed_tests

  def self.tests_by_category(title_category)
    joins(:category)
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
