class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers
  has_many   :comments, as: :commentable

  default_scope { order 'created_at DESC' }

  def author_name
    user.name
  end

  def author
    user
  end

  def answers_count
    answers.size
  end

end
