require 'digest/sha1'

class User < ApplicationRecord

  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { scope: :email, message: "This email is already registered" },
                    format: {with: URI::MailTo::EMAIL_REGEXP, message: "Wrong format"}

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
