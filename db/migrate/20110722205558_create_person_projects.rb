class CreatePersonProjects < ActiveRecord::Migration
  def self.up
    create_table :person_projects do |t|
      t.references :person
      t.references :project

      t.timestamps
    end
  end

  def self.down
    drop_table :person_projects
  end
end
