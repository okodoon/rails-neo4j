class ForceCreate体重uuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :体重, :uuid, force: true
  end

  def down
    drop_constraint :体重, :uuid
  end
end
