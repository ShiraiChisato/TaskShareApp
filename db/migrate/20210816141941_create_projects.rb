class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :projectname,               null: false, default: ""
      t.string :projecticon
      t.string :projectnote
      t.string :topic1,               null: false, default: ""
      t.string :topic2
      t.string :topic3
      t.string :topic4
      t.string :topic5

      t.timestamps
    end
  end
end
