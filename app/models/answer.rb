class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  def question_id
    question.id
  end

  def author
    user
  end

  def author_name
    user.name
  end
end
