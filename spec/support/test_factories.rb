module TestFactories

 def authenticated_user(options={})
   user_options = {
    email: "email#{rand}@fake.com",
    password: 'password'
   }.merge(options)

     user = User.new(user_options)
     user.skip_confirmation!
     user.save
     user
 end

 def associated_item(options={})
   item_options = {
     name: 'Register for Class',
     user: authenticated_user
   }.merge(options)
   Item.create(item_options)
 end

end