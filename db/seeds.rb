# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
if Rails.env.development?
  def random_content
    case rand(3)
    when 1
      Faker::Lorem.question
    when 2
      Faker::Lorem.paragraph(sentence_count: rand(30) + 1)
    else
      Faker::Lorem.sentence
    end
  end

  10.times do
    post = Post.create!(title: Faker::Lorem.sentence, description: random_content)

    rand(10).times do
      post.comments.create(content: random_content)
    end
  end
end
