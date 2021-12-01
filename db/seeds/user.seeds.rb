User.create!(
  email: "darth.vader@example.com",
  first_name: "Darth",
  last_name: "Vader",
  password: "123456"
)
User.create!(
  email: "john.doe@example.com", 
  first_name: "John", 
  last_name: "Doe", 
  password: "123456"
)
User.create!(
  email: "test.test@test.com",  
  first_name: "Test",
  last_name: "Test",
  password: "123456"
)
puts "users created"