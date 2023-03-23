require 'rails_helper'

RSpec.describe ExpensesGroup, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:group) { user.groups.create(name: 'Test Group', icon: 'test') }
  let(:expense) { user.expenses.create(name: 'Test Expense', amount: 10.0) }
  subject { described_class.new(expense:, group:) }

  before { subject.save }

  it 'belongs to an expense' do
    expect(subject.expense).to eq(expense)
  end

  it 'belongs to a group' do
    expect(subject.group).to eq(group)
  end
end
