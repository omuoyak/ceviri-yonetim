class CreateAuthorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.references :user, foreign_key: true
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
