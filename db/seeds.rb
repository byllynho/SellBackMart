# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create!(name: "Thomas Edison", email: "eth3@memphis.edu", password: 123456, department: "Computer Science", 
    major:"Computer Science", validated: true, validation_code:"123543" )
item_1 = user_1.items.build(description: '11111', price: 5, title:'Apple watch', condition: 'good')




user_2 = User.create!(name: "Isaac Newton", email: "nis5@memphis.edu", password: 654321, department: "Computer Science", 
    major:"Computer Science", validated: true, validation_code:"123543" )
set_1 = user_1.deals.build(review: 'Good seller!')

item_2 = user_2.items.build(description: 'not blank', price: 67, title:'ipad2', condition: 'used')

item_2.settlement = set_1
cat_1 = Category.create!(description:"Electornic")
cat_1.products << item_1
cat_1.products << item_2
user_1.save!
user_2.save!
cat_1.save!