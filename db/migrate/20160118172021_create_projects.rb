class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :passphrase, null: false
      t.text :ca_private_key, null: false
      t.text :ca_public_key, null: false

      t.timestamps
    end
  end
end
