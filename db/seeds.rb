# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

class SeedHelper
  def self.create_question(user)
    title = Faker::Lorem.sentence(3).chop
    body  = Faker::Lorem.paragraphs(3).join("\n\n")
    Question.create!(title: title, body: body, user: user)
  end
end

users = [
  {name: 'Mikey',  gender: 'm'},
  {name: 'Mini',   gender: 'f'},
  {name: 'Donald', gender: 'm'},
  {name: 'Goofy',  gender: 'm'},
  {name: 'Peter',  gender: 'm'},
  {name: 'Daisy',  gender: 'f'}
]

users.each do |user|
  User.create!(name: user[:name],
               gender: user[:gender],
               password: 'secret',
               password_confirmation: 'secret',
               role: 'demo').tap do |user|
    SeedHelper.create_question(user)
  end
end
