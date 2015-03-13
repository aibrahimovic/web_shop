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

p1 = Product.new(name: "Lijepe cipele 1", image: "c1.png", price: 100, description: "Obuca za žene se nosi u ovim danima kaoo je sdd", category_id: 1)
p2 = Product.new(name: "Lijepe cipele 2", image: "c2.png", price: 10, description: "Obuca za žene se nosi u ovim danima kaoo je sdd", category_id: 1)
p3 = Product.new(name: "Lijepe cipele 3", image: "c3.png", price: 190, description: "Obuca za žene se nosi u ovim danima kaoo je sdd", category_id: 1)
p4 = Product.new(name: "Lijepe cipele 4", image: "c4.png", price: 80, description: "Obuca za žene se nosi u ovim danima kaoo je sdd", category_id: 1)
p5 = Product.new(name: "Lijepe cipele 5", image: "c5.png", price: 50, description: "Obuca za žene se nosi u ovim danima kaoo je sdd", category_id: 1)
p6 = Product.new(name: "Lijepe cipele 6", image: "c6.png", price: 190, description: "Obuca za žene se nosi u ovim danima kaoo je sdd", category_id: 1)
p7 = Product.new(name: "Lijepe cipele 7", image: "c7.png", price: 30, description: "Obuca za žene se nosi u ovim danima kaoo je sdd", category_id: 1)
p8 = Product.new(name: "Lijepe cipele 8", image: "c8.png", price: 70, description: "Obuca za žene se nosi u ovim danima kaoo je sdd", category_id: 1)
p9 = Product.new(name: "Lijepe cipele 9", image: "m1.png", price: 270, description: "Obuca za muškarce se nosi u ovim danima kaoo je sdd", category_id: 2)
p10 = Product.new(name: "Lijepe cipele 10", image: "m2.png", price: 770, description: "Obuca za muškarce se nosi u ovim danima kaoo je sdd", category_id: 2)
p11 = Product.new(name: "Lijepe cipele 11", image: "m3.png", price: 5, description: "Obuca za muškarce se nosi u ovim danima kaoo je sdd", category_id: 2)
p12 = Product.new(name: "Lijepe cipele 12", image: "m4.png", price: 35, description: "Obuca za muškarce se nosi u ovim danima kaoo je sdd", category_id: 2)
p13 = Product.new(name: "Lijepe cipele 13", image: "m5.png", price: 25, description: "Obuca za muškarce se nosi u ovim danima kaoo je sdd", category_id: 2)

p1.save()
p2.save()
p3.save()
p4.save()
p5.save()
p6.save()
p7.save()
p8.save()
p9.save()
p10.save()
p11.save()
p12.save()
p13.save()

hp1 = HelpProduct.create(size: "36", quantity: 100, product_id: 1)
hp2 = HelpProduct.create(size: "37", quantity: 100, product_id: 1)
hp3 = HelpProduct.create(size: "38", quantity: 100, product_id: 1)
hp4 = HelpProduct.create(size: "37", quantity: 100, product_id: 2)
hp5 = HelpProduct.create(size: "37", quantity: 100, product_id: 3)
hp6 = HelpProduct.create(size: "38", quantity: 100, product_id: 4)
hp7 = HelpProduct.create(size: "37", quantity: 100, product_id: 5)
hp8 = HelpProduct.create(size: "40", quantity: 100, product_id: 5)
hp9 = HelpProduct.create(size: "41", quantity: 100, product_id: 6)
hp10 = HelpProduct.create(size: "45", quantity: 100, product_id: 7)
hp11 = HelpProduct.create(size: "45", quantity: 100, product_id: 8)
hp12 = HelpProduct.create(size: "36", quantity: 100, product_id: 9)
hp13 = HelpProduct.create(size: "40", quantity: 100, product_id: 10)
hp14 = HelpProduct.create(size: "45", quantity: 100, product_id: 11)
hp15 = HelpProduct.create(size: "42", quantity: 100, product_id: 12)
hp16 = HelpProduct.create(size: "48", quantity: 100, product_id: 13)



