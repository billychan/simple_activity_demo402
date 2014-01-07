class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_secure_password

  acts_as_activity_actor

  validate :name,
    length: {in: 5..10},
    format: {with: /\A[A-Za-z]\w+/}
  validate :password,
    length: {in: 4..10}

  def self.demo_users
    where(role: 'demo')
  end

  def gender_ownership
    return '' if self.gender.blank?
    self.gender == 'm' ? 'his' : 'her'
  end
end
