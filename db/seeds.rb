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

p1 = Product.new(name: "Plave tene za žene", price: 100, description: "Udobna obuća za djevojke i žene.", category_id: 1, sale: 80, special: 0)
p2 = Product.new(name: "Udobne štikle", price: 10, description: "Udobne štikle za lagano hodanje.", category_id: 1, sale: '', special: 1)
p3 = Product.new(name: "Crne čizme", price: 190, description: "Čizme za proljeće. Dostupne u tri boje.", category_id: 1, sale: 150, special: 0)
p4 = Product.new(name: "Crne zimske čizme", price: 80, description: "Čizme idealne za zimske dane.", category_id: 1, sale: '', special: 1)
p5 = Product.new(name: "Gležnjače", price: 50, description: "Idealna obuća za jeden. Dostupne u dvije boje.", category_id: 1, sale: '', special: 0)

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


#Image.create(product_id: p1.id, main: '1', avatar: File.new("http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"))


#i1 = Image.create(product_id: p1.id, main: '1')
#i1.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"


#i2 = Image.create(product_id: p1.id, main: nil)
##i2.avatar = File.open('http://web-shop-images.s3.amazonaws.com/images/avatars/m2.png')
#i2.save!

#u = User.new({:name => 'username', :email => 'user@name.fr'...})
#u.avartar = File.open('/Users/myAccount/avatars/user.png')
#u.save!



=begin
i2 = Image.create(product_id: p1.id, main: nil)
i3 = Image.create(product_id: p2.id, main: '1')
i4 = Image.create(product_id: p3.id, main: '1')
i5 = Image.create(product_id: p3.id, main: nil)
i6 = Image.create(product_id: p4.id, main: '1')
i7 = Image.create(product_id: p5.id, main: '1')
i8 = Image.create(product_id: p5.id, main: nil)
i9 = Image.create(product_id: p5.id, main: nil)
i10 = Image.create(product_id: p5.id, main: nil)
=end

=begin
i2.picture_from_url "https://s3.amazonaws.com/web-shop-images/images/avatars/000/000/623/default_url/c6.png"
i3.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/m2.png?1431949342"
i4.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i5.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i6.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i7.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i8.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i9.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
i10.picture_from_url "http://web-shop-images.s3.amazonaws.com/images/avatars/000/000/016/thumb/m2.png?1431949342"
=end

=begin
50.times do |i| 
  p = Product.new
  p.name = g.name
  p.price = g.price
  p.description = g.description
  p.category_id = g.category_id
  p.sale = g.sale
  p.special = g.special
  p.save
end

allP = Product.all
allP.each do |prodi|
  if prodi.id != 209
  	hpp = HelpProduct.new
  	hpp.size = 36
  	hpp.quantity = 100
  	hpp.product_id = prodi.id
  	hpp.save
  	hpp2 = HelpProduct.new
  	hpp2.size = 37
  	hpp2.quantity = 100
  	hpp2.product_id = prodi.id
  	hpp2.save
  end
end

gi = Image.find_by(product_id: 209)
allP.each do |prodi|
  if prodi.id != 210 && prodi.id != 209
    ii = Image.new
    ii.product_id = prodi.id
    ii.main = 1
    ii.picture_from_url "https://s3.amazonaws.com/web-shop-images/images/avatars/000/000/628/default_url/c6.png"
    ii.save!
  end
end

allP = Product.all
allP.each do |product|
  if product.sale != ''
    product.sale = ''
    product.save
  end
end

=end

=begin
ii.picture_from_url "https://s3.amazonaws.com/web-shop-images/images/avatars/000/000/628/default_url/c6.png"  

ii.avatar = gi.avatar

ii = Image.new
ii.avatar = old_photo.avatar

      #ii.avatar_file_name = gi.avatar_file_name
    #ii.avatar_content_type = gi.avatar_content_type
    #ii.avatar_file_size = gi.avatar_file_size

    #ii.save!
   

file = File.open('https://s3.amazonaws.com/web-shop-images/images/avatars/000/000/623/default_url/c5.png')
    ii.avatar = file
    file.close

=end