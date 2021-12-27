class User < ApplicationRecord
  include ImageUploader::Attachment(:avatar)
  extend Enumerize

  AVAILABLE_ROLES = %i[developer lead manager].freeze

  belongs_to :team, optional: true

  has_secure_password
  has_secure_token :password_reset_token

  has_many :activities, dependent: :destroy
  has_many :refresh_tokens, dependent: :destroy

  has_many :task_users, dependent: :destroy
  has_many :tasks, through: :task_users
  has_many :requested_tasks, class_name: "Task", foreign_key: "requester_id",
    dependent: :destroy, inverse_of: :requester

  counter_culture :team

  validates :role, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  enumerize :role, in: AVAILABLE_ROLES, predicates: true, default: :developer, scope: :shallow
end
