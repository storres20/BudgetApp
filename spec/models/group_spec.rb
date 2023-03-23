require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  subject { described_class.new(name: 'Test Group', icon: 'icon', user:) }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).not_to be_valid
  end

  it 'belongs to a user' do
    expect(subject.user).to eq(user)
  end
end
