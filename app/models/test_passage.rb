class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def correct_percent
    100.0 / test.questions.count * correct_questions
  end

  def number_current_questions
    test.questions.where('id <= ?', current_question.id).count
  end

  def done?
    correct_percent >= SUCCESS_PERCENT
  end

  def deadline
    created_at + test.time.minutes
  end

  private

  def correct_answer?(answer_ids)
    if answer_ids.present?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      false
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = if new_record?
      test.questions.order(:id).first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
