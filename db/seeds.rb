User.create!(
  email: "test1.test@test.com",
  first_name: "Darth",
  last_name: "Vader",
  password: "123456"
)
User.create!(
  email: "test2.test@test.com", 
  first_name: "John", 
  last_name: "Doe", 
  password: "123456"
)
User.create!(
  email: "test3.test@test.com",  
  first_name: "Test",
  last_name: "Test",
  password: "123456"
)

user_1 = User.first
user_2 = User.second
user_3 = User.last

puts "users created"

task_1 = Task.create!(title: "task 1")
task_2 = Task.create!(title: "task 2")
task_3 = Task.create!(title: "task 3")

# user_1 has 3 tascks
TaskUser.create!(task: task_1, user: user_1)
TaskUser.create!(task: task_2, user: user_1)
TaskUser.create!(task: task_3, user: user_1)

# task_1 has 3 users
TaskUser.create!(task: task_1, user: user_2)
TaskUser.create!(task: task_1, user: user_3)

puts "tasks created"