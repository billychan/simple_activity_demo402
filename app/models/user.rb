class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_secure_password

  validate :name,
    length: {in: 5..10},
    format: {with: /\A[a-z]\w+/}
  validate :password,
    length: {in: 4..10}
end
