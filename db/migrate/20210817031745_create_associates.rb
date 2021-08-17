class CreateAssociates < ActiveRecord::Migration[6.1]
  def change
    create_table :associates do |t|
      t.integer :UserID
      t.integer :ProjectID
      t.boolean :Host

      t.timestamps
    end
  end
end
