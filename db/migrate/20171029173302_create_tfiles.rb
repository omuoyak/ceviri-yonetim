class CreateTfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :tfiles do |t|
      t.references :repository, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
