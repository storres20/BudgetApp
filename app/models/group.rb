class Group < ApplicationRecord
  has_many :expenses, through: :group_expenses
  has_many :group_expenses
  belongs_to :user
  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true
end
