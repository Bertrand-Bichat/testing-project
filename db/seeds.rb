require 'faker'

Product.destroy_all
User.destroy_all

puts 'Creating 5 products...'

5.times do |i|
  product = Product.create!(
    name: Faker::Company.name,
    tagline: Faker::Company.catch_phrase
  )
  puts "#{i + 1}. #{product.name}"
end

puts 'Creating 1 user...'

User.create!(email: 'test@gmail.com', password: 'password', first_name: 'Bertrand', last_name: 'Bichat')

puts 'Finished!'
