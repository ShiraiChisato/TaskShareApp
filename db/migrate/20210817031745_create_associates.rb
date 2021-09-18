class CreateAssociates < ActiveRecord::Migration[6.1]
  def change
    create_table :associates do |t|
      t.integer :userid,               null: false, default: ""
      t.integer :projectid,               null: false, default: ""
      t.boolean :host

      t.timestamps
    end
  end
end
