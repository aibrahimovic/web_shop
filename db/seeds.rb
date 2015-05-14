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

p1 = Product.new(name: "Plave tene za žene", price: 100, description: "Udobna obuća za djevojke i žene.", category_id: 1, special: 0)
p2 = Product.new(name: "Udobne štikle", price: 10, description: "Udobne štikle za lagano hodanje.", category_id: 1, special: 0)
p3 = Product.new(name: "Crne čizme", price: 190, description: "Čizme za proljeće. Dostupne u tri boje.", category_id: 1, special: 0)
p4 = Product.new(name: "Crne zimske čizme", price: 80, description: "Čizme idealne za zimske dane.", category_id: 1, special: 0)
p5 = Product.new(name: "Gležnjače", price: 50, description: "Idealna obuća za jeden. Dostupne u dvije boje.", category_id: 1, special: 0)
p6 = Product.new(name: "Proljetne cipele", price: 190, description: "Proljetne baletanke. Dostupne u dvije boje.", category_id: 1, special: 0)
p7 = Product.new(name: "Starke", price: 30, description: "Tene za žene. ", category_id: 1, special: 0)
p8 = Product.new(name: "Starke za djevojčice", price: 70, description: "Tene za djevojčice", category_id: 1, special: 0)
p9 = Product.new(name: "Proljetne cipele", price: 270, description: "Udobna obuća za muškarce.", category_id: 2, special: 0)
p10 = Product.new(name: "Smeđe cipele", price: 770, description: "Idelne cipele za proljetne dane.", category_id: 2, special: 0)
p11 = Product.new(name: "Tene za muškarce", price: 5, description: "Idelna obuća za sport.", category_id: 2, special: 0)
p12 = Product.new(name: "Smeđe cipele", price: 35, description: "Idelne cipele za jesenje dane.", category_id: 2, special: 0)
p13 = Product.new(name: "Elegantne cipele", price: 25, description: "Elegantna obuća samo za muškarce.", category_id: 2, special: 0)

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

ca1 = Cart.create(user_id: 1)
ca2 = Cart.create(user_id: 2)


i1 = Image.create(product_id: 13, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i2 = Image.create(product_id: 12, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i3 = Image.create(product_id: 11, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i4 = Image.create(product_id: 10, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i5 = Image.create(product_id: 9, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i6 = Image.create(product_id: 8, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i7 = Image.create(product_id: 7, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i8 = Image.create(product_id: 6, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i9 = Image.create(product_id: 5, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i10 = Image.create(product_id: 4, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i11 = Image.create(product_id: 3, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i12 = Image.create(product_id: 2, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i13 = Image.create(product_id: 1, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: 1)
i14 = Image.create(product_id: 1, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: nil)
i15 = Image.create(product_id: 1, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: nil)
i16 = Image.create(product_id: 1, created_at: "2015-05-12 21:57:56", updated_at: "2015-05-12 21:57:56", avatar_file_name: "c1.png", avatar_content_type: "image/png", avatar_file_size: 92106, avatar_updated_at: "2015-05-12 21:57:54", main: nil)


#Product.all.each_with_index do |product, index|
#	product.image =  File.new("#{Rails.root}/app/assets/images/c#{index+1}.png")
#	product.save	
#end

