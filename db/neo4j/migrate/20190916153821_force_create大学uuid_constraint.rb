class ForceCreate大学uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :大学, :uuid, force: true
  end

  def down
    drop_constraint :大学, :uuid
  end
end
