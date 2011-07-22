class AddProjectToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :project_id, :integer
  end

  def self.down
    remove_column :statuses, :project_id
  end
end
