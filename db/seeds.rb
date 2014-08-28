# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all

@chloe = User.create(email: 'chloe@gmail.com', username: 'csharpd', password: '12345678', password_confirmation: '12345678')

6.times do
@chloe.posts.create(title: "Let's skate", tag_list: '#pretty #pic', address: 'Big Ben, London', picture: 'http://thesnapassembly.com/wp-content/uploads/2011/08/TSA_vintage_skate-02.jpg')
end







