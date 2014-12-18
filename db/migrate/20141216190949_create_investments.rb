class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :amount
      t.integer :duration
      t.belongs_to :project

      t.timestamps
    end
  end
end
