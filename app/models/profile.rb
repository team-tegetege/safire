class Profile < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, primary_key: :user_id

  enum gender: {
    "man": 0,
    "woman": 1,
    "others": 2
  }

end
