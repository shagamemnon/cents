class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :short_desc, :string
    add_column :projects, :long_desc, :text
  end
end
