class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :post1
      t.string :post2
      t.string :post3
      t.string :post4
      t.string :post5

      t.timestamps
    end
  end
end
