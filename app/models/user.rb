class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy
  has_many :feedbacks
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { scope: :email, message: "This email is already registered" },
                    format: {with: URI::MailTo::EMAIL_REGEXP, message: "Wrong format"}

  def level_test(level)
    tests.where(level: level)
  end
  
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
