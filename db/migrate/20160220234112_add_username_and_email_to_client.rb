class AddUsernameAndEmailToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :username, :string
    add_column :clients, :email, :string
  end
end
