class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :user_passed_tests, dependent: :destroy
  has_many :tests, through: :user_passed_tests

  validates :email, presence: true
end
