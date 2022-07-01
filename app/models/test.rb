class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, -> (title_category) { joins(:category)
    .where(categories: { title: title_category })
    .order(title: :desc) }
  scope :test_by_level, -> (level) { where(level: level) }

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true,
                    uniqueness: { scope: :level }

  def self.by_category(category)
    tests_by_category(category).pluck(:title)
  end
end
