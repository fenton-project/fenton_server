# http://edgeguides.rubyonrails.org/active_record_migrations.html#creating-a-standalone-migration

class AddOrganizationIdToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :organization_id, :integer
    change_column_null :projects, :organization_id, false
  end
end
