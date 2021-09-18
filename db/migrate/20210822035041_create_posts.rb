class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :userid,               null: false, default: ""
      t.integer :projectid,               null: false, default: ""
      t.string :post1,               null: false, default: ""
      t.string :post2
      t.string :post3
      t.string :post4
      t.string :post5

      t.timestamps
    end
  end
end
