class ChangeColumnTypeForAmountInInvestment < ActiveRecord::Migration
  def change
    change_column :investments, :amount, :decimal
  end
end
