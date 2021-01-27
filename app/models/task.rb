class Task < ApplicationRecord
  belongs_to :user
  validates_presence_of :due_date, :title, :description
end
