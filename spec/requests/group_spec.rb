require 'rails_helper'

RSpec.describe 'Groups page', type: :system do
  describe 'Groups /index' do
    before(:each) do
      @user = User.create(name: 'name', email: 'email@gmail.com', password: '123456')
      @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png')
      @group = Group.create(name: 'food', icon: @icon_file, user: @user)
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'email@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit groups_path
    end

    after(:each) do
      sleep(2)
    end

    it 'displays the name, date, amount of group' do
      expect(page).to have_content(@group.name)
      expect(page).to have_content(@group.created_at.strftime('%d-%m-%Y'))
      expect(page).to have_content(@group.expenses.sum(:amount))
    end

    it 'click on category' do
      link = find('a', text: @group.name, match: :first)
      link.click
      sleep(1)
      expect(page).to have_current_path group_path(@group)
    end

    it 'click on add new category button' do
      link = find('a', text: 'Add new category')
      link.click
      sleep(1)
      expect(page).to have_current_path new_group_path
    end
  end
  describe 'Groups /show' do
    before(:each) do
      @user = User.create!(name: 'name', email: 'email@gmail.com', password: '123456')
      @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png')
      @group = Group.create(name: 'food', icon: @icon_file, user: @user)
      @expense = Expense.create(name: 'cake', amount: 100, group_ids: [@group.id], user: @user)
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'email@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit group_path(@group)
    end

    after(:each) do
      sleep(2)
    end

    it 'displays the name, date, amount of expense' do
      expect(page).to have_content(@expense.name)
      expect(page).to have_content(@expense.created_at.strftime('%d-%m-%Y'))
      expect(page).to have_content(@expense.amount)
    end

    it 'click on add new transaction button' do
      link = find('a', text: 'Add new transaction')
      link.click
      sleep(1)
      expect(page).to have_current_path new_group_expense_path(@group)
    end
  end
end
