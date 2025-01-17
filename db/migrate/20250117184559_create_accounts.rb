class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :route

      t.timestamps
    end
  end
end
