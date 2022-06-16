class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :answers_limit, on: :create

  private

  def answers_limit
    if question.answers.count >= 4
      errors.add(:question, "У одного вопроса не может быть более 4 ответов!")
    end
  end
end
