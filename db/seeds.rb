# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.new(name: "Administrator")
r2 = Role.new(name: "Registrated")
r1.save()
r2.save()

u1 = User.new(email: "admin@gmail.com", password: "12345", password_confirmation: "12345", role_id: 1)
u2 = User.new(email: "azra@gmail.com", password: "12345", password_confirmation: "12345", role_id: 2)
u1.save()
u2.save()

c1 = Category.new(name: "Ženska obuća")
c2 = Category.new(name: "Muška obuća")
c1.save()
c2.save()

ca1 = Cart.create(user_id: 1)
ca2 = Cart.create(user_id: 2)

#i1 = Image.create(product_id: 1, photo: File.new("image/to/c1.png"), main: '1')
#i2 = Image.create(product_id: 2, photo: File.new("image/to/c1.png"), main: '1')
##i3 = Image.create(product_id: 3, photo: File.new("image/to/c1.png"), main: '1')
#i4 = Image.create(product_id: 4, photo: File.new("image/to/c1.png"), main: '1')
#i5 = Image.create(product_id: 5, photo: File.new("image/to/c1.png"), main: '1')
##i6 = Image.create(product_id: 6, photo: File.new("image/to/c1.png"), main: '1')
#i7 = Image.create(product_id: 7, photo: File.new("image/to/c1.png"), main: '1')
#i7 = Image.create(product_id: 7, photo: File.new("image/to/c1.png"), main: nil)
#i7 = Image.create(product_id: 7, photo: File.new("image/to/c1.png"), main: nil)
#i7 = Image.create(product_id: 7, photo: File.new("image/to/c1.png"), main: nil)



#Product.all.each_with_index do |product, index|
#	product.image =  File.new("#{Rails.root}/app/assets/images/c#{index+1}.png")
#	product.save	
#end

