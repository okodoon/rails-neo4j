class ForceCreate年数uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :年数, :uuid, force: true
  end

  def down
    drop_constraint :年数, :uuid
  end
end
