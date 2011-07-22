class CreatePeopleProjects < ActiveRecord::Migration
  def self.up
    create_table :people_projects, :id => false do |t|
      t.references :person
      t.references :project
      t.timestamps
    end
  end

  def self.down
    drop_table :person_projects
  end
end
