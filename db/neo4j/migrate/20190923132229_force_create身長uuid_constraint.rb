class ForceCreate身長uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :身長, :uuid, force: true
  end

  def down
    drop_constraint :身長, :uuid
  end
end
