class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.references :repository, foreign_key: true
      t.string :title
      t.text :detail
      t.string :label
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
