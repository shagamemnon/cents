class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :monetary_goal
      t.belongs_to :user
      t.belongs_to :charity

      t.timestamps
    end
  end
end
