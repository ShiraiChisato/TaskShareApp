class AddTopic1ToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :topic1, :string
    add_column :projects, :topic2, :string
    add_column :projects, :topic3, :string
    add_column :projects, :topic4, :string
    add_column :projects, :topic5, :string
  end
end
