class GistsController < ApplicationController

  before_action :set_test_passage, only: %i[new create]

  def new
    @gist = Gist.new
  end

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create(question: @test_passage.current_question, user: current_user, url: result.url)
      flash[:notice] = "#{t('.success')} - #{view_context.link_to(t('.link'), result.url)}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage, status: :see_other
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
