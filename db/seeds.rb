# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create!(name: "Thomas Edison", email: "eth3@memphis.edu", password: "123456", department: "Computer Science", 
    major:"Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00" )
item_1 = user_1.items.build(description: '11111', price: 5, title:'Apple watch', condition: 'good')




user_2 = User.create!(name: "Isaac Newton", email: "nis5@memphis.edu", password: "654321", department: "Computer Science", 
    major:"Computer Science" ,confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00")
set_1 = user_1.deals.build(review: 'Good seller!')

item_2 = user_2.items.build(description: 'not blank', price: 67, title:'ipad2', condition: 'used')

item_2.settlement = set_1
cat_1 = Category.create!(description:"Electornic")
cat_1.products << item_1
cat_1.products << item_2
user_1.save!
user_2.save!
cat_1.save!


user_3 = User.create!(name: "Admin Istrator", email: "admin@memphis.edu", major: "Computer Science", 
    department: "Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00",
    password: "123456" )
user_3.save!
