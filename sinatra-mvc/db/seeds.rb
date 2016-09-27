require 'faker'

population = Range.new(1,40) 

population.each do 
	Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthdate: Faker::Date.between(80.years.ago, 18.years.ago))
end 

#create loop with range 1 to 40, Person.create and .each to create 40 records 