# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#r1 = Role.new(name: "Administrator")
#r2 = Role.new(name: "Registrated")
#r1.save()
#r2.save()

#u1 = User.new(email: "admin@gmail.com", password: "12345", password_confirmation: "12345", role_id: 1)
#u2 = User.new(email: "azra@gmail.com", password: "12345", password_confirmation: "12345", role_id: 2)
#u1.save()
#u2.save()

#c1 = Category.new(name: "Ženska obuća")
#c2 = Category.new(name: "Muška obuća")
#c1.save()
#c2.save()

#ca1 = Cart.create(user_id: 1)
#ca2 = Cart.create(user_id: 2)

p1 = Product.new(name: "Plave tene za žene", name2: "Blue shoes fof women",  price: 100, description: "Udobna obuća za djevojke i žene.", description2: "Comfortable shoes for women", category_id: 1, sale: 80, special: 0)
p2 = Product.new(name: "Udobne štikle", name2: "Comfortable heels", price: 10, description: "Udobne štikle za lagano hodanje.", description2: "Comfortable shoes for women", category_id: 1, sale: '', special: 1)
p3 = Product.new(name: "Crne čizme", name2: "Comfortable heels", price: 190, description: "Čizme za proljeće. Dostupne u tri boje.", description2: "Comfortable shoes for women", category_id: 1, sale: 150, special: 0)
p4 = Product.new(name: "Crne zimske čizme", name2: "Comfortable heels", price: 80, description: "Čizme idealne za zimske dane.", description2: "Comfortable shoes for women", category_id: 1, sale: '', special: 1)
p5 = Product.new(name: "Gležnjače", name2: "Comfortable heels", price: 50, description: "Idealna obuća za jeden. Dostupne u dvije boje.", description2: "Comfortable shoes for women", category_id: 1, sale: '', special: 0)

p1.save()
p2.save()
p3.save()
p4.save()
p5.save()

hp1 = HelpProduct.create(size: "36", quantity: 100, product_id: p1.id)
hp2 = HelpProduct.create(size: "37", quantity: 100, product_id: p1.id)
hp3 = HelpProduct.create(size: "38", quantity: 100, product_id: p1.id)
hp4 = HelpProduct.create(size: "37", quantity: 100, product_id: p2.id)
hp5 = HelpProduct.create(size: "37", quantity: 100, product_id: p3.id)
hp6 = HelpProduct.create(size: "38", quantity: 100, product_id: p4.id)
hp7 = HelpProduct.create(size: "37", quantity: 100, product_id: p5.id)
hp8 = HelpProduct.create(size: "40", quantity: 100, product_id: p5.id)


i1 = Image.create(product_id: p1.id, main: '1')
i2 = Image.create(product_id: p1.id, main: nil)
i3 = Image.create(product_id: p2.id, main: '1')
i4 = Image.create(product_id: p3.id, main: '1')
i5 = Image.create(product_id: p3.id, main: nil)
i6 = Image.create(product_id: p4.id, main: '1')
i7 = Image.create(product_id: p5.id, main: '1')
i8 = Image.create(product_id: p5.id, main: nil)
i9 = Image.create(product_id: p6.id, main: nil)
i10 = Image.create(product_id: p5.id, main: nil)


i1.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/c3.png?1431949295"
i2.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/017/m4.png?1431949352"
i3.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/m2.png?1431949342"
i4.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i5.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i6.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i7.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i8.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i9.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i10.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
