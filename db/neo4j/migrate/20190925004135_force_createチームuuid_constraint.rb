class ForceCreateチームuuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :チーム, :uuid, force: true
  end

  def down
    drop_constraint :チーム, :uuid
  end
end
