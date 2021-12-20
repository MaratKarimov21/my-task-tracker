class AddColumnsToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :description, :string
    add_column :tasks, :status, :string, null: false
    add_column :tasks, :finished_at, :datetime
  end
end
