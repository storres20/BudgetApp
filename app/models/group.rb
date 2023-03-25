class Group < ApplicationRecord
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  has_one_attached :icon

  validates :name, presence: true
end
