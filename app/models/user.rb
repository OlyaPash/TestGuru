require 'digest/sha1'

class User < ApplicationRecord

  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
