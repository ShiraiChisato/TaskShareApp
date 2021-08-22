class AddProjectnameToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :projecticon, :string
    add_column :projects, :projectnote, :string
  end
end
