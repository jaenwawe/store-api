# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Store.destroy_all
Order.destroy_all

puts "Seeding users"
users=[]
stores=[]


# generate 10 users
10.times do 
   u= User.create!(
        username:  Faker::Twitter.screen_name,
        password:  Faker::Alphanumeric.alpha(number: 8),
        email:Faker::Internet.email,
        first_name: Faker::Name.unique.name,
        last_name:  Faker::Name.last_name,
        phone_number:  Faker::PhoneNumber.cell_phone,
        address: Faker::Address.street_address,
        unit: Faker::Address.secondary_address,
        state:  Faker::Address.state_abbr,
        zipcode:  Faker::Address.zip_code
    )
    users<<u
end

puts "Seeding Stores"
# generates 5 stores
breads =["wheat", "whole wheat", "nut", "multigrain", "enriched white", "rye", "banana", "english muffin"]
5.times do
    s=Store.create!(
        name: Faker::Company.name,
        motto: Faker::Company.catch_phrase,
        product: breads.sample, 
        price: rand(3..8)
    )
    stores<<s
end
 


puts "Seeding Confirmations"
20.times do
    #byebug
    Order.create!(
            user_id: users.sample.id,
            store_id: stores.sample.id,
            total: rand(3..6),
            review_title: Faker::Company.catch_phrase,
            review_stars: rand(1..5),
            review: Faker::Restaurant.review   
    )
end

puts "Seeding done!"





