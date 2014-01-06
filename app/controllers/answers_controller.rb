class AnswersController < ApplicationController

  # include SimpleActivity::ControllerMethods

  def create
    @answer = current_user.answers.new(create_params)
    flash[:alert] = 'Wrong input' unless @answer.save
    redirect_to :back
  end

  def destroy
    @answer = Answer.find(delete_params[:id])
    @answer.delete
    redirect_to :back
  end

  private

  def create_params
    params.require(:answer).permit(:body, :question_id)
  end

  def delete_params
    params.permit(:id)
  end

end
