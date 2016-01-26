# http://edgeguides.rubyonrails.org/active_record_migrations.html#creating-a-standalone-migration

class AddKeyToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :key, :string
    change_column_null :projects, :key, false
  end
end
