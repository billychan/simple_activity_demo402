class QuestionsController < ApplicationController

  def index
    @questions = Question.page(params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to root_path, notice: "You have asked a new question"
    else
      render 'new'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
