foodie = Foodie.create(email: "peter@email.com", name: "Peter", password: "password")
post = Post.create(title: "Sample title", text: "This is a post.", foodie_id: foodie.id)
puts 'DONE'