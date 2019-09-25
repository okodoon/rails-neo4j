class ForceCreate選手uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :選手, :uuid, force: true
  end

  def down
    drop_constraint :選手, :uuid
  end
end
