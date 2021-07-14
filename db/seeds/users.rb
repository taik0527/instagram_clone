# frozen_string_literal: true

puts 'Start inserting seed "users" ...'
10.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    username: Faker::Internet.unique.user_name,
    password: 'password',
    password_confirmation: 'password'
  )
  user.avatar.attach(io: File.open(Rails.root.join('app/assets/images/profile-placeholder.png')),
                     filename: 'profile-placeholder.png')
  user.save
  puts "\"#{user.username}\" has created!"
end
