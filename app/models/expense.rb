class Expense < ApplicationRecord
  has_many :groups, through: :group_expenses
  has_many :group_expenses
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true
end
