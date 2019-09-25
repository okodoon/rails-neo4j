class ForceCreate投打uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :投打, :uuid, force: true
  end

  def down
    drop_constraint :投打, :uuid
  end
end
