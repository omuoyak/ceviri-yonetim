class CreateRepositoryLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :repository_languages do |t|
      t.references :language, foreign_key: true
      t.references :repository, foreign_key: true

      t.timestamps
    end
  end
end
