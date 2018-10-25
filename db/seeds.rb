# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
	city = City.create!(
		name: Faker::Address.city
		)
end
=begin
25.times do
	dogwalker = Dogsitter.create!(
		city_id: Faker::Number.within(City.first.id..City.last.id)
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		)
end
=end

25.times do
	dog = Dog.create!(
		name: Faker::Name.first_name,
		city_id: Faker::Number.within(City.first.id..City.last.id)
		)
end

50.times do
	stroll = Stroll.create!(
		city_id: Faker::Number.within(City.first.id..City.last.id),
		dogwalker_id: Faker::Number.within(Dogsitter.first.id..Dogsitter.last.id),
		date: Faker::Time.between(30.days.ago, Date.today, :day)
		)
end

Stroll.all.each do |stroll|
	rand(6).times {
		stroll.dogs << Faker::Number.within(Dog.first.id..Dog.last.id)
		}
end


=begin Tentative de matching intelligent... Not successful

50.times do
	city = Faker::Number.within(City.first.id..City.last.id)
	compatible_dogsitters = Dogsitter.where(city_id: city)

	stroll = Stroll.create!(
		city_id: city,
		dogwalker_id: compatible_dogsitters[rand(compatible_dogsitters.count)-1],
		date: Faker::Time.between(30.days.ago, Date.today, :day)
		)
end

Stroll.all.each do |stroll|
	rand(6).times {
		compatible_dogs = Dog.where(city_id: stroll.city_id)
		stroll.dogs << compatible_dogs[rand(compatible_dogs.count)-1]
		}
end

=end