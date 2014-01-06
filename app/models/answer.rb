class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  delegate :id, :title, to: :question, prefix: true

  def author
    user
  end

  def author_name
    user.name
  end

end
