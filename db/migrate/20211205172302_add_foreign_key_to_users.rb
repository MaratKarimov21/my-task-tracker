class AddForeignKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    safety_assured { add_foreign_key :users, :teams }
  end
end
