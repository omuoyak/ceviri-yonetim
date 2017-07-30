class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.string :name
      t.integer :status
      t.references :owner, foreign_key: true
      t.string :source_url
      t.references :contributors, foreign_key: true
      t.string :source_lang
      t.integer :priority
      t.references :original_content, foreign_key: true
      t.references :translated_contents, foreign_key: true

      t.timestamps
    end
  end
end
