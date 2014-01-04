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
    body  = Faker::Lorem.paragraphs(3).join('\n')
    Question.create!(title: title, body: body, user: user)
  end
end

names = ['Mikey', 'Mini', 'Donald', 'Goofy', 'Peter', 'Daisy']

names.each do |name|
  User.create!(name: name,
               password: 'secret',
               password_confirmation: 'secret',
               role: 'demo').tap do |user|
    SeedHelper.create_question(user)
  end
end
