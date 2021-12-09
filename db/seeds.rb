team = Team.create!(name: "technomer")

user_1 = User.create!(
  email: "darth.vader@example.com",
  first_name: "Darth",
  last_name: "Vader",
  password: "123456",
  role: "developer",
  team_id: team.id
)
user_2 = User.create!(
  email: "john.doe@example.com", 
  first_name: "John", 
  last_name: "Doe", 
  password: "123456",
  role: "developer",
  team_id: team.id
)
user_3 = User.create!(
  email: "test.test@test.com",  
  first_name: "Test",
  last_name: "Test",
  password: "123456",
  role: "developer",
  team_id: team.id
)
manager = User.create!(
  email: "test4.test4@test4.com",  
  first_name: "Test",
  last_name: "Test",
  password: "123456",
  role: "manager",
  team_id: team.id
)

puts "users created"

task_1 = Task.create!(title: "task 1", kind: "feature", complexity: 1, requester_id: manager.id)
task_2 = Task.create!(title: "task 2", kind: "feature", complexity: 1, requester_id: manager.id)
task_3 = Task.create!(title: "task 3", kind: "feature", complexity: 1, requester_id: manager.id)