class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :route
      t.string :line_user_id
      t.string :email
      t.string :phone
      t.string :name
      t.string :birthday
      t.string :contact_info

      t.timestamps
    end
  end
end
