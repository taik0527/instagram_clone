# frozen_string_literal: true

puts 'Start inserting seed "posts" ...'
User.limit(10).each do |user|
  post = user.posts.new(body: Faker::Hacker.say_something_smart)
  post.images.attach(io: File.open(Rails.root.join('app/assets/images/sea.jpeg')), filename: 'sea.jpeg')
  post.save
  puts "post#{post.id} has created!"
end
