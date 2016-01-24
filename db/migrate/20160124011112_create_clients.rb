class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.text :public_key, null: false

      t.timestamps
    end
  end
end
