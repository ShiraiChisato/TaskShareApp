class CreateAssociates < ActiveRecord::Migration[6.1]
  def change
    create_table :associates do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :host

      t.timestamps
    end
  end
end
