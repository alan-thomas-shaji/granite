class Task < ApplicationRecord
    MAX_BODY_LENGTH = 125
    validates :body, presence: true, length: { maximum: 125 }
end