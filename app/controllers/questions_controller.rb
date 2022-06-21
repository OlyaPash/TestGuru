class QuestionsController < ApplicationController

  before_action :find_test, only: [:create, :index]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.pluck(:body)
    render plain: questions.join("; ")

    # render json: @test.questions
  end

  def show
    render plain: @question.body

    # render json: @question
  end

  def new; end

  def create
    @question = @test.questions.build(questions_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос был удален!'
  end

  private

  def questions_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Такого вопроса нет!"
  end
end
