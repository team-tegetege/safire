class Project < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, primary_key: :user_id
  has_many :project_tag, primary_key: :id, foreign_key: :project_id
  has_many :member, primary_key: :id, foreign_key: :project_id
  has_many :rate, primary_key: :id, foreign_key: :project_id

  accepts_nested_attributes_for :project_tag

  enum color: {
    "red": 0,
    "blue": 1,
    "green": 2
  }
end
