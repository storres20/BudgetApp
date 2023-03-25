class AddExpenseRefToGroupExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_expenses, :expense, null: false, foreign_key: { to_table: 'expenses' }
  end
end
