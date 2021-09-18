class CreateAssociates < ActiveRecord::Migration[6.1]
  def change
    create_table :associates do |t|
      t.integer :userid
      t.integer :projectid
      t.boolean :host

      t.timestamps
    end
  end
end
