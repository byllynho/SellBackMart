# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
user1 = User.new(id:1,name:'Varun Negandhi',email:'vsngndhi@memphis.edu',password:'var123',department:'CS',major:'Masters',validated:true,validation_code:'1234')
user1.items.build(title:'Apple Macbook',price:'$300',image:'mac.png',condition:2,inactive:false,
    description:'Its just 2 year old laptop. Good condition and latest upgraded OS')
user1.items.build(title:'Distributed Systems Textbook',price:'$30',image:'os.png',condition:5,inactive:false,
    description:'Textbook for the distributed computing course')
user1.items.build(title:'Machine Learning by Mitchell',price:'$100',image:'machine.png',condition:8,inactive:false,
    description:'A new textbook in perfect condition')
=end

user_1 = User.new(name: "Admin Istrator", email: "admin@memphis.edu", major: "Computer Science", 
    department: "Computer Science",password: "123456" )
user_1.items.build(avatar:'',title:'Apple Macbook',price:300.00,condition:2,category_id:2,description:'Its just 2 year old laptop. Good condition and latest upgraded OS',
    inactive:false)
user_1.items.build(title:'Iphone X',price:200.25,image:'iphone.png',condition:2,inactive:false,
    description:'Its just 2 year old phone. Good condition and latest upgraded OS',category_id:1)
user_1.items.build(title:'Distributed Computing Textbook',price:78.25,image:'tb.png',condition:3,inactive:false,
    description:'Almost new textbook for Distributed computing course',category_id:3)
user_1.save!
        