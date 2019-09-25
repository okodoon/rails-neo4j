class ForceCreate年齢uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :年齢, :uuid, force: true
  end

  def down
    drop_constraint :年齢, :uuid
  end
end
