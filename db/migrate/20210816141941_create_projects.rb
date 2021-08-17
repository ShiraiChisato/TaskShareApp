class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.String :projectname

      t.timestamps
    end
  end
end
