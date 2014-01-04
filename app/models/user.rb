class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_secure_password

  validate :name,
    length: {in: 5..10},
    format: {with: /\A[A-Za-z]\w+/}
  validate :password,
    length: {in: 4..10}

  def self.demo_users
    where(role: 'demo')
  end
end
