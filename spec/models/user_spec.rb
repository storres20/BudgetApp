require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'John Doe') }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'destroys associated groups on delete' do
    group = subject.groups.create(name: 'Test Group', icon: 'test')
    subject.destroy
    expect(Group.count).to eq(0)
  end

  it 'destroys associated expenses on delete' do
    expense = subject.expenses.create(name: 'Test Expense', amount: 10.0)
    expect { subject.destroy }.to change { Expense.count }.by(-1)
  end
end
