class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.references :tfile, foreign_key: true
      t.references :language, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status
      t.text :content

      t.timestamps
    end
  end
end
