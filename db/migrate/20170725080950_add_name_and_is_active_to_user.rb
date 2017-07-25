class AddNameAndIsActiveToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :is_active, :boolean, default: true
  end
end
