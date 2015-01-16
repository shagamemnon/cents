class AddPercentageCompleteColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :percentage_complete, :decimal
  end
end
