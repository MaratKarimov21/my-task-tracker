class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :kind
      t.integer :complexity
      t.references :requester, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
