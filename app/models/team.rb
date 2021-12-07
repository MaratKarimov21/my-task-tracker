class Team < ApplicationRecord
  has_many :users, dependent: :nullify

  has_one :lead, -> { lead }, class_name: "User", dependent: :nullify

end
