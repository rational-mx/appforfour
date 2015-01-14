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
post = Post.new(
	body: "Este es un commet dura duran espis din weis",
	user_id: user.id
)
post.save!
