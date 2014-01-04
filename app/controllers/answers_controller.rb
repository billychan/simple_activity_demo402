class AnswersController < ApplicationController

  def create
    @answer = current_user.answers.new(answer_param)
    flash[:alert] = 'Wrong input' unless @answer.save
    redirect_to :back
  end

  private

  def answer_param
    params.require(:answer).permit(:body, :question_id)
  end

end
