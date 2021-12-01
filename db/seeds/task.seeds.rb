after :users do
  user_1 = User.first
  user_2 = User.second
  user_3 = User.last

  task_1 = Task.create!(label: "task 1")
  task_2 = Task.create!(label: "task 2")
  task_3 = Task.create!(label: "task 3")

  # user_1 has 3 tascks
  TaskUser.create!(task: task_1, user: user_1)
  TaskUser.create!(task: task_2, user: user_1)
  TaskUser.create!(task: task_3, user: user_1)

  # task_1 has 3 users
  TaskUser.create!(task: task_1, user: user_1)
  TaskUser.create!(task: task_1, user: user_2)
  TaskUser.create!(task: task_1, user: user_3)

  puts "tasks created"

end