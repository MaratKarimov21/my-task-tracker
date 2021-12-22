team = Team.create!(name: "technomer")

user_1 = User.create!(
  email: "darth.vader@example.com",
  first_name: "Darth",
  last_name: "Vader",
  password: "123456",
  role: "developer",
  team: team
)
user_2 = User.create!(
  email: "john.doe@example.com", 
  first_name: "John", 
  last_name: "Doe", 
  password: "123456",
  role: "developer",
  team: team
)
user_3 = User.create!(
  email: "test.test@test.com",  
  first_name: "Test",
  last_name: "Test",
  password: "123456",
  role: "developer",
  team: team
)
manager = User.create!(
  email: "test1.test@test.com",
  first_name: "Test",
  last_name: "Test",
  password: "123456",
  role: "manager",
  team: team
)
puts "users created"

task_1 = Task.create!(title: "task 1", complexity: 2, kind: "feature", requester: manager,)
task_2 = Task.create!(title: "task 2", complexity: 2, kind: "feature", requester: manager,)
task_3 = Task.create!(title: "task 3", complexity: 2, kind: "feature", requester: manager,)

# user_1 has 3 tascks
TaskUser.create!(task: task_1, user: user_1)
TaskUser.create!(task: task_2, user: user_1)
TaskUser.create!(task: task_3, user: user_1)

# task_1 has 3 users
TaskUser.create!(task: task_1, user: user_2)
TaskUser.create!(task: task_1, user: user_3)

puts "tasks created" 
