require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expense = Expense.new(name: 'Test Expense', amount: 10.0, user: User.new(name: 'Test User'))
      expect(expense).to be_valid
    end

    it 'is not valid without a name' do
      expense = Expense.new(amount: 10.0, user: User.new(name: 'Test User'))
      expect(expense).not_to be_valid
    end

    it 'is not valid without an amount' do
      expense = Expense.new(name: 'Test Expense', user: User.new(name: 'Test User'))
      expect(expense).not_to be_valid
    end

    it 'is not valid with a negative amount' do
      expense = Expense.new(name: 'Test Expense', amount: -10.0, user: User.new(name: 'Test User'))
      expect(expense).not_to be_valid
    end

    it 'is not valid without a user' do
      expense = Expense.new(name: 'Test Expense', amount: 10.0)
      expect(expense).not_to be_valid
    end
  end
end
