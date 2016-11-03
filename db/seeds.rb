require 'faker'


users = 10.times.map do
  User.create!( :username   => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

questions = 10.times.map do
  Question.create!( title: Faker::Hipster.sentence(3) + "?",
                    description: Faker::Hipster.paragraph(3),
                    author_id: (1..10).to_a.sample )
end

comments = 10.times.map do
  Comment.create!( response: Faker::Hacker.say_something_smart,
                   commenter_id: (1..10).to_a.sample,
                   commentable_id: (1..10).to_a.sample
                   commentable_type: ["question", "answer"].sample)
end

answers = 10.times.map do
  Answer.create!( gif: Faker::Avatar.image,
                  answerer_id: (1..10).to_a.sample,
                  question_id: (1..10).to_a.sample)
end

votes = 10.times.map do
  Vote.create!( voter_id: (1..10).to_a.sample,
                voteable_id: (1..10).to_a.sample,
                voteable_type: ["question", "answer", "comment"].sample)
end
