FactoryBot.define do
  factory :task do
    title { "some title" }
    description { "some description" }
    kind { "feature" }
    requester { create :user, :manager }
    complexity { 3 }
  end
end
