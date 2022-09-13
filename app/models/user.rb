# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  MAX_NAME_LENGTH = 35
  MAX_EMAIL_LENGTH = 50
  has_many :comments, dependent: :destroy
  has_many :created_tasks, foreign_key: :task_owner_id, class_name: "Task"
  has_many :tasks, dependent: :destroy, foreign_key: :assigned_user_id

  validates :name, presence: true, length: { maximum: 35 }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 50 },
    format: { with: VALID_EMAIL_REGEX }
  validates :password,
    presence: true,
    confirmation: true,
    length: { minimum: 6 }
  validates :password_confirmation, presence: true, on: :create

  before_save :to_lowercase

  has_secure_password
  has_secure_token :authentication_token

  private

    def to_lowercase
      email.downcase!
    end
end
