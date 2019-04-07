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
item_1 = user_1.items.build(avatar:'',title:'Apple Macbook',price:300.00,condition:2,category_id:2,description:'Its just 2 year old laptop. Good condition and latest upgraded OS',
    inactive:false)
user_1.save!   
=begin
user1 = User.new(id:1,name:'Varun Negandhi',email:'vsngndhi@memphis.edu',password:'var123',department:'CS',major:'Masters',validated:true,validation_code:'1234')
user1.items.build(title:'Apple Macbook',price:'$300',image:'mac.png',condition:2,inactive:false,
    description:'Its just 2 year old laptop. Good condition and latest upgraded OS')
user1.items.build(title:'Distributed Systems Textbook',price:'$30',image:'os.png',condition:5,inactive:false,
    description:'Textbook for the distributed computing course')
user1.items.build(title:'Machine Learning by Mitchell',price:'$100',image:'machine.png',condition:8,inactive:false,
    description:'A new textbook in perfect condition')




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
# item_1.update(avatar_file_name:'textbooks.png')

user_1.items.build(avatar:'',title:'Iphone X',price:200.25,condition:2,inactive:false,
    description:'Its just 2 year old phone. Good condition and latest upgraded OS',category_id:1)
user_1.items.build(avatar:'',title:'Distributed Computing Textbook',price:78.25,condition:3,inactive:false,
    description:'Almost new textbook for Distributed computing course',category_id:3)

user_1.save!
        
user_3.save!
=end