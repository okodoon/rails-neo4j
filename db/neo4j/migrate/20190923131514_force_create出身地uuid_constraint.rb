class ForceCreate出身地uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :出身地, :uuid, force: true
  end

  def down
    drop_constraint :出身地, :uuid
  end
end
