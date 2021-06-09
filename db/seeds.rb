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

puts 'Finished!'
