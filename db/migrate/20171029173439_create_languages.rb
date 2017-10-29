class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.string :iso_code
      t.string :title
      t.string :flag

      t.timestamps
    end
  end
end
