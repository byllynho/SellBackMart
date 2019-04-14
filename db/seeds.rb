# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user_1 = User.create!(name: "Thomas Edison", email: "eth3@memphis.edu", password: "123456", department: "Computer Science", 
#     major:"Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
#     confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00" )

# user_2 = User.create!(name: "Isaac Newton", email: "nis5@memphis.edu", password: "654321", department: "Computer Science", 
#     major:"Computer Science" ,confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
#     confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00")

# # user_3 = User.create!(name: "Admin Istrator", email: "admin@memphis.edu", major: "Computer Science", 
# #     department: "Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
# #     confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00",
# #     password: "123456" )

# user_4 = User.create!(name: "Andrew", email: "andrew@memphis.edu", major: "Computer Science", 
#     department: "Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
#     confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00",
#     password: "123456" )

# cat_1 = Category.create!(description:"Electronics")
# cat_2 = Category.create!(description:"Textbooks")
# cat_3 = Category.create!(description:"School Supplies")


# item_1 = user_1.items.build(description: '11111', price: 5, title:'Apple watch', condition: 'good')
# item_1.update(avatar_file_name: 'bopit.jpg')
# cat_1.products << item_1

# set_1 = user_1.deals.build(review: 'Good seller!')

# item_2 = user_2.items.build(description: 'not blank', price: 67, title:'ipad2', condition: 'used')
# item_2.update(avatar_file_name: 'bopit.jpg')
# item_2.settlement = set_1
# cat_1.products << item_2

# user_1.save!
# user_2.save!
# cat_1.save!
# cat_2.save!
# cat_3.save!

# item_3 = user_3.items.build(description: "This is my item. Please buy it.", price: 3.25, title: "My Awesome Item", condition: 'used')
# item_3.update(avatar_file_name: 'bopit.jpg')
# cat_1.products << item_3

# item_4 = user_3.items.build(description: "This weird guy with a terrible beard keeps bothering me. I will pay someone to get him to leave.", price: -10, title: "Weird Guy With Beard", condition: 'used')
# item_4.update(avatar_file_name: 'beard.jpg')
# cat_1.products << item_4

# user_3.save!

# item_5 = user_4.items.build(description: "Textbook by C.S. Lewis", price: 12, title: "The Pilgrim's Guide", condition: 'used')
# cat_1.products << item_5
# user_4.save!


elec = Category.create!(description:"Electronics")
text = Category.create!(description:"Textbooks")
school = Category.create!(description:"School Supplies")

thomas = User.create!(name: "Thomas Edison", email: "thomas@memphis.edu", password: "123456", department: "Herff College of Engineering", 
    major:"Electrical Engineering", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00" )



    lightbulb = thomas.items.build(description: 'With this brand new invention, you can stay up as late as you want to partying or working on homework!', price: 15, title:'Electric Lightbulb', condition: 0)
<<<<<<< HEAD
    lightbulb.update(avatar: 'Photo on 4-7-19 at 10.53 PM #3')
=======
    lightbulb.update(avatar_file_name: 'lightbulb.jpg')
>>>>>>> 1d4598bffb268350032e2f18db8b1ced595860b3
    elec.products << lightbulb

thomas.save!

isaac = User.create!(name: "Isaac Newton", email: "isaac@memphis.edu", password: "123456", department: "Physics", 
    major:"Classical Physics" ,confirmed_at: "Thu, 07 Apr 2019 010:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 07 Apr 2019 10:54:31 UTC +00:00")

    apple = isaac.items.build(description: "Looking for a way to get some extra credit? Give this apple to your teacher, and you will be on their good side in no time. As an added bonus, this product also doubles as a doctor-repellant.", price: 2, title:'Apple!', condition: 1)
    apple.update(avatar_file_name: 'apple.png')
    school.products << apple

isaac.save!

phil = User.create!(name: "Freshman Phil", email: "phil@memphis.edu", password: "123456", department: "Undecided", 
    major:"Undecided" ,confirmed_at: "Thu, 07 Apr 2019 010:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 07 Apr 2019 10:54:31 UTC +00:00")

phil.save!

billy = User.create!(name: "Billy Graham", email: "billy@memphis.edu", password: "123456", department: "School of Religion and Philosophy", 
    major:"Biblical Preaching" ,confirmed_at: "Thu, 07 Apr 2019 010:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 07 Apr 2019 10:54:31 UTC +00:00")

   joy = billy.items.build(description: "Follow the life of young atheist C.S. Lewis (author of The Chronicles of Narnia), as he searches for joy, until unexpectedly finding it in Jesus Christ.", price: 10, title:'C.S. Lewis: Surprised by Joy', condition: 1)
    joy.update(avatar_file_name: 'joy.jpg')
    school.products << joy

billy.save!

applecomment1 = BuyerComment.create!(item_id: apple.id, user_id: thomas.id, comment_text: "Some people wouldn't know a good idea if it hit them in the head, but Isaac, my friend, you are a genius.")
lightbulbcomment1 = BuyerComment.create!(item_id: lightbulb.id, user_id: isaac.id, comment_text: "What a bright idea. If you are tired of playing video-games by candlelight, I hereby advise you to buy Thom's latest invention.")
joycomment1 = BuyerComment.create!(item_id: joy.id, user_id: isaac.id, comment_text: "Is the book an autobiography or historical biography?")
joyresponse1 = SellerResponse.create!(buyer_comment_id: joycomment1.id, response_text: "Actually, it is a partial autobiography.")
joytransaction = Transaction.create!(item_id: joy.id, user_id: isaac.id, review: "This is a great read, and the seller was kind and reliable")
joy.update(inactive: true)