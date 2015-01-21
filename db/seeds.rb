# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new(
  username: "user",
  email: "user@mail.com",
  password:  '12345678',
  password_confirmation: '12345678'
)
user.save!
user2 = User.new(
  username: "user2",
  email: "user2@mail.com",
  password:  '12345678',
  password_confirmation: '12345678'
)
user2.save!  
post = Post.new(
	body: "Este es un commet dura duran espis din weis",
	user_id: user.id
)
post.save!

post.device_inf = DeviceInf.new(browser: "Pe", os: "ne")
post.device_inf.save!

40.times {
  |i|  
  comment = Comment.new(body: "Comment #{i} ") 
  comment.post = post
  comment.user =user
  comment.save!
  comment.device_inf = DeviceInf.new(browser: "Pe", os: "ne")
  comment.device_inf.save!
}