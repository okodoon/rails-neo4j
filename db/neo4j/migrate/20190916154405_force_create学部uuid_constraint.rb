class ForceCreate学部uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :学部, :uuid, force: true
  end

  def down
    drop_constraint :学部, :uuid
  end
end
