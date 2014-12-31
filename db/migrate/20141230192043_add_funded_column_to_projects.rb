class AddFundedColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :funded, :decimal
  end
end
