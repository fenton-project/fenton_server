class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.text :certificate, null: false
      t.integer :client_id, null: false
      t.integer :project_id, null: false

      t.timestamps
    end
  end
end
