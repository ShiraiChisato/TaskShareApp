class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.String :username
      t.String :email
      t.String :password

      t.timestamps
    end
  end
end
