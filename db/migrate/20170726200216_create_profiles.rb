class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :picture
      t.string :username
      t.string :bio
      t.string :website
      t.string :gender

      t.timestamps
    end
  end
end
