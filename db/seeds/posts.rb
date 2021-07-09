# frozen_string_literal: true

puts 'Start inserting seed "posts" ...'
User.limit(10).each do |user|
  post = user.posts.create(body: Faker::Hacker.say_something_smart)
  post.images.attach(io: File.open(Rails.root.join('app/assets/images/sea.jpeg')),
                     filename: 'sea.jpg')
  puts "post#{post.id} has created!"
end
