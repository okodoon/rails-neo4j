class ForceCreate血液型uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :血液型, :uuid, force: true
  end

  def down
    drop_constraint :血液型, :uuid
  end
end
