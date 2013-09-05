# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.delete_all

languages = ["German", "French", "Italian", "Russian"]

languages.each do |language| 
  Language.new(:name => language).save
end

puts "languages added"

User.delete_all

puts "Creating Admins"
admin = {:firstname => "Anna", :lastname => "Hendre", :biography => "Nothing special about me",:skype_account => "hendranna", :email => "hendrannah@gmail.com", :password => "password", :password_confirmation => "password"  }
user = User.new(admin)
user.role = "admin"
user.save
puts "admin created"