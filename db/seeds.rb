# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Make other users
%w(Wilbur@tp.com Murad@tp.com David@tp.com).each do |name|
  User.create email: name, password: 'password'
end

# Make user trips
Trip.create user_id: 1, name: 'Wilbur Trip', morning: 'Cafe Milano, Bancroft Way, Berkeley, CA', breakfast: 'Pancho Villa Taqueria, 16th Street, San Francisco, CA'
Trip.create user_id: 2, name: 'Murad Trip', morning: 'Golden Bear Cafe, Sather Road, Berkeley, CA', breakfast: 'Cafe 3, Durant Avenue, Berkeley, CA'
Trip.create user_id: 3, name: 'David Trip', morning: 'U Cha, Bancroft Way, Berkeley, CA', breakfast: 'CREAM Berkeley, Telegraph Avenue, Berkeley, CA'

# Make user reviews
Review.create user_id: 1, trip_id: 2, title: 'swagout', description: 'Great place!'
Review.create user_id: 2, trip_id: 3, title: 'Awesome!', description: 'Great place!'
Review.create user_id: 3, trip_id: 1, title: 'Perfect place to go!', description: 'Great place!'